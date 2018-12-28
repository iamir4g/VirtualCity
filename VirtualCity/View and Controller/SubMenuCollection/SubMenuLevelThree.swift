//
//  SubMenuLevelThree.swift
//  VirtualCity
//
//  Created by amir farahani on 5/2/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SubMenuLevelThree: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var mySubMenu2 : MenuUnion!
   
    var menu = ["نوشت افزار","ورزشی"]
    var whichsubmenu:Int = 0
    var subcatName:String = ""
    var subCatID:Int = 0
    var subCatIDToSend:Int = 0
    @IBOutlet weak var subMenuCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = subcatName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let countM = mySubMenu2 {
            switch countM {
            case .menuMenuClassArray(let value):
                return value.count
            default :
                return 0
            }
        }
        return 0//menu.count//mySubMenu2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let subMenuCell = subMenuCollection.dequeueReusableCell(withReuseIdentifier: "submenucell", for: indexPath) as! SubMenuCollectionViewCell
        if let cellM = mySubMenu2{
            switch cellM {
            case .menuMenuClassArray(let value):
                subMenuCell.lblname.text = value[indexPath.row].name
            default :
                print("oooops")
            }
        }
        return subMenuCell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if let selectM = mySubMenu2 {
            switch selectM {
            case .menuMenuClassArray(let value):
                subCatIDToSend = value[indexPath.row].id!
            default :
                print("oops")
        }
        }
        performSegue(withIdentifier: "gotopage4", sender: nil)
    }
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotopage4" {
            let page4 = segue.destination as! ShopTableViewController
            page4.selectesSubMenuID = self.subCatIDToSend
            
        }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
   
}
