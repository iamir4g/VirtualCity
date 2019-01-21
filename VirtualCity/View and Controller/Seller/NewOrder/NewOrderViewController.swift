//
//  NewOrderViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 11/1/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class NewOrderViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var newOrderTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newOrderCell = newOrderTV.dequeueReusableCell(withIdentifier: "newordercell") as! NewOrderCell
        return newOrderCell
        
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
extension NewOrderViewController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "neworder")
    }
    
}
