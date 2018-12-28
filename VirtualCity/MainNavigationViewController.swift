//
//  MainNavigationViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 1/26/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MainNavigationViewController: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func getCathegory() {
//        let shopcaturl = "http://diar.city/api/v1/nav_menu?locale=fa"
//        Alamofire.request(shopcaturl).responseNewEmpty { response in
//            if let empty = response.result.value {
//                print("json is : \(empty)")
//                let json = JSON(response.data)
//                print(json)
//                newMenu = empty
//            }
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-
         based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
