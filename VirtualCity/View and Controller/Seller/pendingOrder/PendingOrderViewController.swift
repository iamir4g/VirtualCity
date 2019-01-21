//
//  PendingOrderViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 11/1/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PendingOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var pendindTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pendingCell = pendindTV.dequeueReusableCell(withIdentifier: "pendingcell") as! PendingOrderCell
        
        return pendingCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PendingOrderViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "pendingorder")
    }
    
}
