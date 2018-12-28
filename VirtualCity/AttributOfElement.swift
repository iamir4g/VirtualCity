//
//  AttributOfElement.swift
//  VirtualCity
//
//  Created by amir farahani on 2/9/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func setAttrForTextField(textField:UITextField,placeholder:String,setIAmge:String){
        //set icon iamge
        var imageView = UIImageView();
        var image = UIImage(named: setIAmge);
        imageView.image = image;
        textField.rightView = imageView
        textField.rightViewMode = UITextFieldViewMode.always
        //set placeholder
        textField.placeholder = placeholder
        //set reduce
        textField.layer.cornerRadius = 15.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    func setAttButon(buttone : UIButton){
        buttone.layer.cornerRadius = 10.0
        buttone.titleLabel?.font = UIFont(name: "IRANSansMobile", size: 15)
        
    }
    func AlertView(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
