//
//  MainShopViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 5/6/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON
var shopDetial : GetOneStoreDetail!
var ShopID : Int = 0
class MainShopViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var shopimage: UIImageView!
    @IBOutlet weak var shopname: UILabel!
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
   
   
    override func viewDidAppear(_ animated: Bool) {
        getShopDetail(shopid: ShopID){ aa in
            self.shopname.text = aa.shop?.name
        }
    }
  
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
        }
        super.viewDidLoad()

       // self.shopname.text = shopDetial.shop?.name ?? ""
        
       // print("shop cat : \(ShopID)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func likeStorebtn(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "isLogin") == true {
            let paramToLikeStore:Parameters = ["token":"\(UserDefaults.standard.string(forKey: "token")!)"]
            likeOneStore(param: paramToLikeStore, shopid: ShopID){
                liked in
                if liked.errorCode == 100 {
                    self.AlertView(title: "توجه", message: "سپاس از شما ")
                }else{
                    self.AlertView(title: "توجه", message: "جزو فروشگاه دلخواه اضافه نشد مجددا تلاش کنید")
                }
            }
        }else {
            AlertView(title: "توجه", message: "اپتدا وارد شوید")
        }
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let news = UIStoryboard(name: "ShopStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "News")
        let about = UIStoryboard(name: "ShopStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "About")
        let comments = UIStoryboard(name: "ShopStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "Comments")
        let products = UIStoryboard(name: "ShopStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "Products")
        return [news, about,comments,products]
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
