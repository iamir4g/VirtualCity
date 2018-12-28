//
//  AllSaveFumction.swift
//  VirtualCity
//
//  Created by amir farahani on 9/30/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Save Profile To Core Data
func SaveProfileToCoreData(profileVlue:LoginOrAuthenticate,completion: (_ finished: Bool) -> ()){
    let profileManageContext = appDelegate.persistentContainer.viewContext
    let profile = Profile(context: profileManageContext)
    profile.name = profileVlue.name
    profile.lastname = profileVlue.fullName
    profile.adress = profileVlue.address
    profile.national_code = profileVlue.nationalCode
    profile.city = profileVlue.city
    profile.state = profileVlue.state
    profile.avatar = profileVlue.avatar
    profile.chat_chamel_id = profileVlue.chatChannelID
    profile.email = profileVlue.secondEmail
    profile.invaite_code = profileVlue.inviteCode
    profile.shop_id = Int16(profileVlue.shopID!)
    //profile.sosialNikname = profileVlue.socialNickName
   // profile.user_id =
    do {
        try profileManageContext.save()
        print("Save Profile")
        completion(true)
    } catch  {
        print("Profile Not save")
        completion(false)
    }
}
func SaveCart(id:Int16,number:Int16,price:Int16,name:String,pic:String,completion: (_ finished: Bool) -> ()){
    let cartManageContext = appDelegate.persistentContainer.viewContext
    let cart = Cart(context: cartManageContext)
    
    cart.id = id
    cart.number = number
    cart.price = price
    cart.name = name
    cart.pic = pic
    do {
        try cartManageContext.save()
        print("Save cart")
        completion(true)
    } catch  {
        print("cart Not save")
        completion(false)
    }
}


