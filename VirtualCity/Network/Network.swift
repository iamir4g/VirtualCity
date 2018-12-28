//
//  Network.swift
//  VirtualCity
//
//  Created by amir farahani on 9/27/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
// MARK: - Get One shop Detail
func getShopDetail(shopid:Int,completion: @escaping (GetOneStoreDetail) -> ())  {
    let URL = "http://diar.city/api/v1/shop/\(shopid)"
    Alamofire.request(URL).responseGetOneStoreDetail{ respons in
        
        respons.result.ifSuccess {
            //let aa = JSON(respons.data)
            let bb = respons.result.value
            //print("shop : \(respons.result.value?.shop)  \n Swifty : ")
            shopDetial = respons.result.value
            //print("shop : name : \(bb!.shop!.name) \n address : \(bb!.shop!.address)")
            //self.shopname.text = bb!.shop!.name
            completion(bb!)
            }.error
    }
}
// MARK: - Login
func login(param:Parameters,completion: @escaping (LoginOrAuthenticate) -> ()){
    Alamofire.request("http://diar.city/api/v1/auth", method: .post, parameters: param, encoding: JSONEncoding.default).responseLoginOrAuthenticate {respons  in
       // let vaaa = JSON(respons.data!)
       // print("Login JSON ; \(vaaa)")
        respons.result.ifSuccess {
            if let login = respons.result.value {
                completion(login)
            }
            }.ifFailure {
                
                print("Error")
        }
    }
}
// MARK: - Like Store
func likeOneStore(param:Parameters,shopid:Int,completion: @escaping (LikeStore) -> ()){
    Alamofire.request("http://diar.city/api/v1/like_store/\(shopid)", method: .post, parameters: param, encoding: JSONEncoding.default).responseLikeStore {respons  in
        // let vaaa = JSON(respons.data!)
        // print("Login JSON ; \(vaaa)")
        respons.result.ifSuccess {
            if let login = respons.result.value {
                completion(login)
            }
            }.ifFailure {
                
                print("Error")
        }
    }
}

