//
//  ViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 12/30/17.
//  Copyright © 2017 amir farahani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var Token:String = ""
    @IBOutlet weak var rejesterbtn: UIButton!
    
  
    @IBOutlet weak var phonemailtext: UITextField!
    
    
    @IBOutlet weak var passtext: UITextField!
    let phone:String = "09353344537"
    let pass:String = "asdfff"
//    let url:URL = String("http://vsrv.diar.city/api/auth")
    @IBAction func forgetpsaa(_ sender: Any) {
        
    }
    @IBAction func loginbtn(_ sender: Any) {
      
        if (phonemailtext.text != "" && passtext.text != "")
        {
          let param:Parameters = ["email":"\(phonemailtext.text!)","password":"\(passtext.text!)","locale":"fa"]
            ConnectToServer(url: "http://srv.diar.city/api/auth",paramToSend: param)
        }else{
            Alert(myMessage: "لطفا موراد خواسته شده را تکمیل نمایید")
            phonemailtext.text = ""
            passtext.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showrejester"
        {
//            performSegue(withIdentifier: "showrejester", sender: self)
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
    func ConnectToServer(url:String,paramToSend:Parameters)
    {
        
        Alamofire.request(url, method: .post, parameters: paramToSend, encoding: JSONEncoding.default)
            .validate().responseJSON{respons  in

            }
            .responseJSON { response in
                if response.data != nil{
                    let json = JSON(response.data)
                    self.Token = json["token"].stringValue
                    
                }
                print("this is respons : \(response)")
        }
        }
}

