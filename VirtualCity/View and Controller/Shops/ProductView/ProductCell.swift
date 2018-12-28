//
//  ProductCell.swift
//  VirtualCity
//
//  Created by amir farahani on 9/27/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    var count = 1
    
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var procount: UILabel!
    @IBOutlet weak var mines: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var like: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var proNameLbl: UILabel!
    @IBOutlet weak var proPriceLbl: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBAction func plus(_ sender: Any) {
       // if count == 1 {
            count += 1
            procount.text = "\(count)"
       // }
        
    }
    @IBAction func mines(_ sender: Any) {
        if count == 1 {
            
        }else {
            count -= 1
            procount.text = "\(count)"
        }
    }
    var addButtonTapAction : (()->())?
    @IBAction func addTocart(_ sender: Any) {
        addButtonTapAction?()
        print("name :\(proNameLbl.text)  price :\(proPriceLbl.text)  count : \(procount.text) ")
    }
//    func addButtonTapAction() {
//        SaveCart(id: 1, number: Int16(procount.text!)!, price: Int16(proPriceLbl.text!)!, name: proNameLbl.text!, pic: ""){ bb in
//
//
//        }
//    }
    @IBAction func sahrebtn(_ sender: Any) {
    }
    @IBAction func likebtn(_ sender: Any) {
    }
    
}
