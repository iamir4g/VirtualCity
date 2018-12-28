//
//  Tools.swift
//  VirtualCity
//
//  Created by amir farahani on 1/2/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class tools: UIView {
    let defult = UserDefaults.standard
    
    //this func use for creat url beacuse base url is unique
    func baseurl(addurl:String) -> String {
        return "https://application2.irantracking.com/modsapi/api/ECSOSApplicant/\(addurl)"
    }
    //this func for save a vlaue to sharePrefences
    func ForSaveVal(Key:String,Value:Any) {
        
        defult.set(Value, forKey:Key)
        
    }
    // this func for catch a value for key store in Share Prefences
    func ForReadVal(key:String) -> Any {
        return defult.value(forKeyPath: key)
    }
}
