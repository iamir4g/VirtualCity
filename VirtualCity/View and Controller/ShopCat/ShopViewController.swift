//
//  ShopViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 1/25/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import CoreData
import Foundation


class ShopViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {



    @IBOutlet weak var CatCollectionView: UICollectionView!
   // @IBOutlet weak var hidinView: UIView!
    @IBOutlet weak var indi: UIActivityIndicatorView!
   // var menu = [getMenu]()
    var newMenu : GetCategory?
   // var firstLvl = [SuperMenu]()
    var secondLvl : [CatMenu]!
   // var myMenu = [NewCatMenu]()

    var selectedName:String = ""
    var selectedId:Int = 0
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @NSManaged var value: [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.CatCollectionView.delegate = self
       CatCollectionView.layer.cornerRadius = 5.0
        getCathegory()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.newMenu?.cats?.count ?? 0 //self.firstLvl.count//self.newMenu?.cats.count
        
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! CollectionCell
        let firstLvl = self.newMenu?.cats
        cell.collectionlbl.text = firstLvl![indexPath.row].name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         //fetchMenu()
        let selectNameCollection = collectionView.cellForItem(at: indexPath) as! CollectionCell
        let menu = self.newMenu?.cats
        selectedId = (self.newMenu?.cats![indexPath.row].id)!
        selectedName = (self.newMenu?.cats![indexPath.row].name)!
        secondLvl = (self.newMenu?.cats![indexPath.row].menu)!
        print("\(self.newMenu?.cats?[indexPath.row].menu)\(self.newMenu?.cats?[indexPath.row].name)\(self.newMenu?.cats?[indexPath.row].id)" )
        print("id selected is : \(selectedId)")
        performSegue(withIdentifier: "gotopage2", sender: nil)
        
    }
    func getCathegory() {
        let shopcaturl = "http://diar.city/api/v1/nav_menu?locale=fa"
        Alamofire.request(shopcaturl).responseGetCategory { response in
            print("\(response.result.value)")
                if let empty = response.result.value {
                    print("json is : \(empty)")
                    let json = JSON(response.data)
                    
                    self.newMenu = empty
//                    for empt in empty.cats!{
//                        for em in empt.menu!{
//                            if let aa = em.menu {
//                                switch aa {
//                                case .menuMenuClassArray(let value):
//                                    for val in value {
//                                        print("aaaa : \(val.name)")
//                                    }
//                                default :
//                                    print("rifi")
//                                }
//                            }
//                        }
//                    }
                    DispatchQueue.main.async {
                        self.CatCollectionView.reloadData()
                    }
                }
            }
        }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotopage2"{
            
            let Shop2 = segue.destination as! CasbOCarViewController
            Shop2.catId = selectedId
            Shop2.catName = selectedName
            Shop2.mySubMenu = secondLvl
            print("cat name : \(selectedName)  cat id : \(selectedId)")
            }
        if segue.identifier == "gotoCart" {
            print("basket")
        }
        }
    
}


