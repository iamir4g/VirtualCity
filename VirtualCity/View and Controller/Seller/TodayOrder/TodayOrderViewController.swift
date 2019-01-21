//
//  TodayOrderViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 11/1/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class TodayOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var todayTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todayCell = todayTV.dequeueReusableCell(withIdentifier: "todaycell") as! TodayOrderCell
        return todayCell
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
extension TodayOrderViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "todayorder")
    }
    
}
