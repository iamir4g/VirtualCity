//
//  MainViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/9/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate



class MainViewController: UIViewController {

//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let context = appDelegate.persistentContainer.viewContext
//    let entity = NSEntityDescription.entity(forEntityName: "Profile", in: context)
//    let newUser = NSManagedObject(entity: entity!, insertInto: context)
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var rejestrationBtn: UIButton!
    @IBOutlet weak var forgetBtn: UIButton!
    @IBOutlet weak var rulsBtn: UIButton!
    var authValue : LoginOrAuthenticate!
    let token = UserDefaults.standard
    //var profileData :[NSManagedObjectContext] = []
    @IBAction func loginBtn(_ sender: Any) {
        if (phoneText.text != nil) && (passwordText.text != nil){
            guard let number = phoneText.text else{return Alert(myMessage: "shomare ra vared namayid") }
            let digt = "" + number.suffix(10)
            let paramToSend = ["email":"\(digt)","password":"\(passwordText.text!)"]
            print("param is to login : \(paramToSend)")
            login(param: paramToSend) { loginValue in
                UserDefaults.standard.set(self.phoneText.text, forKey: "phoneNumber")
                UserDefaults.standard.set(loginValue.token!, forKey: "token")
                UserDefaults.standard.set(true, forKey: "isLogin")
                SaveProfileToCoreData(profileVlue: loginValue) { (done) in
                    if done {
                        self.authValue = loginValue
                        self.performSegue(withIdentifier: "ifloginok", sender: nil)
                        self.Alert(myMessage: "login anjam shod")
                    }else{
                        self.AlertView(title: "توجه ", message: "در ورود خطایی رخ داده است")
                    }
                }
            }
        }
    }
  
    override func viewDidAppear(_ animated: Bool) {
        let tokenfortestlogin = self.token.value(forKey: "token")
        if tokenfortestlogin != nil{
            
            self.performSegue(withIdentifier: "ifloginok", sender: nil)
            
        }else{print("LOGIN NIST LOGIN KONID")}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr(textField: phoneText, placeholder: "موبایل/ایمیل")
        setAttr(textField: passwordText, placeholder: "گذرواژه")
        setAttButon(buttone: loginBtn)
        setAttButon(buttone: rejestrationBtn)
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with:event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func login(param:Parameters){
//        Alamofire.request("http://diar.city/api/v1/auth", method: .post, parameters: param, encoding: JSONEncoding.default).responseLoginOrAuthenticate {respons  in
//            switch re
//            if let login = respons.result.value {
//                self.authValue = login
//
//                if login.status == "successful" {
//
//                    UserDefaults.standard.set(login.token, forKey: "token")
//                    UserDefaults.standard.set(self.phoneText.text, forKey: "phoneNumber")
//                    UserDefaults.standard.set(true, forKey: "isLogin")
//                    self.performSegue(withIdentifier: "ifloginok", sender: nil)
//                    self.Alert(myMessage: "login anjam shod")
//
//                }
//            }
//            }
//        }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ifloginok" {
            let loginValue = segue.destination as! LoginViewController
            loginValue.loginValue = self.authValue
        }
    }
 
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
        textField.font = UIFont(name: "IRANSansMobile", size: 12)
    }
    /*
    func setAttButon(buttone : UIButton){
        buttone.layer.cornerRadius = 10.0
        buttone.titleLabel?.font = UIFont(name: "IRANSansMobile", size: 15)
        
    }
    */
    func parsJSONLogin(jsonRejester: JSON){
        let code = jsonRejester["error_code"].stringValue
        print("erorr code : \(jsonRejester["error_code"].stringValue)")
        
        let status = jsonRejester["status"].stringValue
        if status == "fail"{
            print(jsonRejester)
            self.phoneText.text = ""
            self.passwordText.text = ""
            Alert(myMessage: "shomare mobile ya password eshtebah ast")
        }else if status == "successful"{
            print(jsonRejester)
            print("token is \(jsonRejester["token"].stringValue) \n ")
            
            let tokenInJson = jsonRejester["token"].stringValue
            self.token.set(tokenInJson, forKey: "token")
            self.performSegue(withIdentifier: "ifloginok", sender: nil)
            Alert(myMessage: "login anjam shod")
        }else{
            print(jsonRejester)
            Alert(myMessage: "مشگلی در ثبت نام بوحود امده ")
        }
    }
}
