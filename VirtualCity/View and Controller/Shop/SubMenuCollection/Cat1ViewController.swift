//
//  Cat1ViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 1/25/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Cat1ViewController: UICollectionViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var subMenuTwo = [getMenu]()
    var whichsubmenu:Int = 0
    var subcatName:String = ""
    var subCatID:Int = 0
    @IBOutlet weak var subMenuCollection: UICollectionView!
    //let submenuFroshgahi = ["ورزشی","نوشت افزار"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = subcatName
        switch subCatID {
        case 16:
            getSubCathegory2(whichsubmenu: 0, subMenu: 0)
        case 19:
            getSubCathegory2(whichsubmenu: 0, subMenu: 1)
        case 20 :
            getSubCathegory2(whichsubmenu: 1, subMenu: 0)
            
        default:
            print("RIDI 1")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subMenuTwo.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = subMenuCollection.dequeueReusableCell(withReuseIdentifier: "submenucell", for: indexPath) as! SubMenuCollectionViewCell
        cell.lblname.text = subMenuTwo[indexPath.row].name
        
        return cell
    }
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//    }
    func getSubCathegory2(whichsubmenu:Int,subMenu:Int) {
        let shopcaturl = "http://vcity.kohastam.com/api/v1/nav_menu?locale=fa"
        Alamofire.request(shopcaturl).response{ respons in
            switch(respons.response?.statusCode) as! Int{
            case 200 :
                let json = JSON(respons.data)
                let menusInJson = json["cats"][whichsubmenu][subMenu]["menu"].arrayValue
                for menu in menusInJson{
                    let model = getMenu()
                    model.pasrs(json: menu)
                    self.subMenuTwo.append(model)
                }
                print(self.subMenuTwo)
                self.subMenuCollection.reloadData()
            default:
                print("error is ")
            }
        }
//        self.subMenuCollection.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
