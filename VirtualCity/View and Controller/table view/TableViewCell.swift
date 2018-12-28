//
//  TableViewCell.swift
//  VirtualCity
//
//  Created by amir farahani on 2/2/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var shopnamelbl: UILabel!
    @IBOutlet weak var addresshoplbl: UILabel!
    @IBOutlet weak var isopenlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
