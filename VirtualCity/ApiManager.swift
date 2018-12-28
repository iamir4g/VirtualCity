//
//  ApiManager.swift
//  VirtualCity
//
//  Created by amir farahani on 2/5/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
/*
class ApiManager {
    
    static let shared = ApiManager()
    
  private init() {
        
    }
    
    func fetchCathegory() -> Promise<[Cats]> {
        /
        return Promise<[Cats]> {
            fullfil,reject -> Void in
            var catRespons:CathegoryRespons
            Alamofire.request("http://srv.diar.city/api/v1/nav_menu?locale=fa",encoding: JSONEncoding.default).responseString {
                respons in
                switch (respons.result) {
                    
                case .success(let responsData) :
                    // = respons.data
                    print("OK 200")
                    // print("data is : \(responsData)")
                    let json = JSON(respons.data)
                    catRespons  =  CathegoryRespons(JSONString: "\(json)")!//CathegoryRespons(JSON: ["AMir" : responsData])
                    fullfil((catRespons?.cats)!)
                    
                    print("cat when maped : \(catRespons?.cats)")
                    
                default:
                    print("Nok!")
                    
                }
                
            }
        }
        

      
       
        }


    }
*/
