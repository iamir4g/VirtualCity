//
//  XibTableViewCell.swift
//  VirtualCity
//
//  Created by amir farahani on 2/5/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit

class XibTableViewCell: UITableViewCell {

    @IBOutlet weak var shopnamelbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
