//
//  NewOrderCell.swift
//  VirtualCity
//
//  Created by amir farahani on 11/1/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit

class NewOrderCell: UITableViewCell {

    @IBOutlet weak var basketIDlbl: UILabel!
    @IBOutlet weak var timeBasketlbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var imagelbl: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
