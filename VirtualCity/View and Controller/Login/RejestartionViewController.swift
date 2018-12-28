//
//  RejestartionViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/9/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RejestartionViewController: UIViewController {

    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var rePasswordTxt: UITextField!
    @IBOutlet weak var ceratBtn: UIButton!
    @IBOutlet weak var rulsBtn: UIButton!
   
    @IBAction func rejesterBtn(_ sender: Any) {
        
        if (phoneTxt.text != nil) && (passwordTxt.text != nil) && (rePasswordTxt.text != nil) {
                    if passwordTxt.text == rePasswordTxt.text{
                        let paramRejester = ["email":"\(phoneTxt.text!)","password":"\(passwordTxt.text!)","password_confirmation":"\(rePasswordTxt.text!)","verification_type":"sms","sms_number":"\(phoneTxt.text!)","gender":"male","locale":"fa"]
                        print("item to send : \(paramRejester)")
                                rejester(param: paramRejester)
                        self.dismiss(animated: true, completion: nil)
                    }else{
                        Alert(myMessage: "tatbigh nadarad")
                        phoneTxt.text = ""
                        passwordTxt.text = ""
                        rePasswordTxt.text = "" }
        }else{Alert(myMessage: "لطفا موارد خواسته شده را به طور سحیح کامل نمایید")}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr(textField: phoneTxt, placeholder: "موبایل")
        setAttr(textField: passwordTxt, placeholder: "رمزعبور")
        setAttr(textField: rePasswordTxt, placeholder: "تکرار رمز هبور")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with:event)
    }
    
    func rejester(param:Parameters){
        Alamofire.request("http://srv.diar.city/api/v1/register", method: .post, parameters: param, encoding: JSONEncoding.default)
            .validate().responseJSON{respons  in
                guard let data = respons.data else{return}
                switch (respons.response?.statusCode) as! Int {
                case 200 :
                    let fromServer = JSON(data)
                    self.parsJSONRejestration(jsonRejester: fromServer)
                   
                default:
                    print("rifdi")
                }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func Alert(myMessage:String) {
        // create the alert
        let alert = UIAlertController(title: "توجه!!", message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "باشه", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        present(alert, animated: true, completion: nil)
        
    }
    func setAttr(textField:UITextField,placeholder:String){
        //set icon iamge
        
        textField.rightViewMode = UITextFieldViewMode.always
        //set placeholder
        textField.placeholder = placeholder
        //set reduce
        textField.layer.cornerRadius = 15.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    func parsJSONRejestration(jsonRejester: JSON){
        let code = jsonRejester["error_code"].stringValue
        let status = jsonRejester["status"].stringValue
        if status == "successful"{
            print(jsonRejester)
            Alert(myMessage: "ثبت نام با موفقیت انحام شد \nاوتومات به صفحه قبل بازگشته و لاگین نمایید ")
            //self.dismiss(animated: true, completion: nil)
        }else{
            print(jsonRejester)
            Alert(myMessage: "مشگلی در ثبت نام بوحود امده ")
        }
    }
    

}
