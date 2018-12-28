//
//  CasbOCarViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/2/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData
class CasbOCarViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var casboCarCollection: UICollectionView!
   // var subMenuOne = [getMenu]()
    var catName:String = ""
    var catId:Int = 0
    var mySubMenu : [CatMenu]!
   // var thirdLvl: [getMenu]!
    //var amir : NewMenuUnion!

    var thirdLvl: MenuUnion!
    @IBOutlet weak var hidinView: UIView!
    @IBOutlet weak var indi: UIActivityIndicatorView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return mySubMenu.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell2

        cell.collection2lbl.text = mySubMenu[indexPath.row].name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         self.thirdLvl = mySubMenu[indexPath.row].menu
        
          //let nnn = mySubMenu[indexPath.row].id
        
         performSegue(withIdentifier: "gotopage3", sender: nil)
//       // if nnn == 16{
//
//        } else {
//            AlertView(title: "اوپس", message: "داده ای برای نمایش وجود ندارد")
//        }
    }
    @IBOutlet weak var collectionviewpage2: UICollectionView!
    @IBOutlet weak var navBarPage2: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotopage3"{
           let submenu2 = segue.destination as! SubMenuLevelThree
            //submenu2.subCatID = catId
           // submenu2.subcatName = catName
            submenu2.mySubMenu2 = self.thirdLvl
            print("to send next view : \(catName)")
        }
    }
}

