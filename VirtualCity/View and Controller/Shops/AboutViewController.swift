//
//  AboutViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 5/25/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AboutViewController: UIViewController,IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "About")
    }
    @IBOutlet weak var adresslbl: UILabel!
    @IBOutlet weak var servicesslbl: UILabel!
    @IBOutlet weak var phonelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var facebookbtn: UIButton!
    @IBOutlet weak var telegrambtn: UIButton!
    @IBOutlet weak var instagrambtn: UIButton!
    @IBOutlet weak var whatsappbtn: UIButton!
    @IBOutlet weak var linkdinbtn: UIButton!
    @IBOutlet weak var satlbl: UILabel!
    @IBOutlet weak var sunlbl: UILabel!
    @IBOutlet weak var monlbl: UILabel!
    @IBOutlet weak var tuslbl: UILabel!
    @IBOutlet weak var wndlbl: UILabel!
    @IBOutlet weak var thulbl: UILabel!
    @IBOutlet weak var frilbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        adresslbl.text = shopDetial.shop!.address ?? ""
        servicesslbl.text = shopDetial.shop!.region ?? ""
        phonelbl.text = shopDetial.shop!.phone ?? ""
        satlbl.text = WorkingTiMeString(index: 0)
        sunlbl.text = WorkingTiMeString(index: 2)
        monlbl.text = WorkingTiMeString(index:4)
        tuslbl.text = WorkingTiMeString(index: 6)
        wndlbl.text = WorkingTiMeString(index: 8)
        thulbl.text = WorkingTiMeString(index: 10)
        frilbl.text = WorkingTiMeString(index: 12)
     //   worktimelbl.text = WorkingTiMeString(index: 0)
//        let tag = worktimelbl.tag
//        switch tag {
//        case 1:
//            worktimelbl.text = WorkingTiMeString(index: 0)
//        case 2 :
//            worktimelbl.text = WorkingTiMeString(index: 1)
//        default:
//            print("oops")
//        }

        // Do any additional setup after loading the view.
    }
    func WorkingTiMeString(index:Int) -> String {
        let aa = shopDetial.shop!.workingTimes!
        print("\(aa[index]) الی \(aa[index + 1])")
        let workString = "\(aa[index]) الی \(aa[index + 1])"
        return workString
    }
    @IBAction func chatbtn(_ sender: Any) {
        self.AlertView(title: "توجه", message: " متاسفانه هنوز این امکان هنوز فراهم نشده")
    }
    
    @IBAction func callbtn(_ sender: Any) {
        self.dialNumber(number: shopDetial.shop!.phone ?? "")
    }
    func dialNumber(number : String) {
        
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
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
@IBDesignable
class FormTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
