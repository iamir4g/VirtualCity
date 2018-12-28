//
//  ForgetViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/9/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit

class ForgetViewController: UIViewController {

    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var rulsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttButon(buttone: resendBtn)
        setAttButon(buttone: rulsBtn)
        setAttrForTextField(textField: phoneTxt, placeholder: "موبایل", setIAmge: "")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with:event)
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
