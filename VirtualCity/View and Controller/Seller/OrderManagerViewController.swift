//
//  OrderManagerViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 11/1/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire

class OrderManagerViewController: ButtonBarPagerTabStripViewController {

    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)


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
        changeCurrentIndexProgressive = { [weak self] (oldCell2: ButtonBarViewCell?, newCell2: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell2?.label.textColor = .black
            newCell2?.label.textColor = self?.purpleInspireColor
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let newOrder = UIStoryboard(name: "SellerStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "neworder")
        let pendingOrder = UIStoryboard(name: "SellerStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "pendingorder")
        let todayOrder = UIStoryboard(name: "SellerStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "todayorder")
       // let products = UIStoryboard(name: "SellerStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "Products")
        return [newOrder,pendingOrder,todayOrder]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
