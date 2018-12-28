//
//  IfLoginViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/11/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {

    var loginValue : LoginOrAuthenticate!
    var profile : [Profile]!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var nationalNumberLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var adressTxt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "token") == true {
            //navigationItem.backBarButtonItem?.isEnabled = false
        }
        //if UserDefaults.standard.bool(forKey: "isLogin") == true {
       //  loginValue = UserDefaults.value(forKey: "loginvalue") as! LoginOrAuthenticate
      //  self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        fetchProfileValue(){ (done) in
            if done {
                fullNameLbl.text = "\(profile[0].name!) \(profile[0].lastname!)"
                nationalNumberLbl.text = profile[0].national_code
                phoneLbl.text = UserDefaults.standard.string(forKey: "phoneNumber")
                adressTxt.text = profile[0].adress!//loginValue.address
                nationalNumberLbl.text = profile[0].national_code!
//                if loginValue.address != nil {
//                    adressTxt.text = loginValue.address!
//                }
            }
        }
       
       // }
    }
    func fetchProfileValue(completion: (_ complete: Bool) -> ()) {
        let profileManageContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
          self.profile = try profileManageContext.fetch(request) as! [Profile]
            //print("aaaaaaa : \(aa)")
            completion(true)
        } catch  {
            print("Unable to fetch data: ", error)
            completion(false)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
