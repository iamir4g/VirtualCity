//
//  NotifyViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 11/2/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit

class NotifyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var notifyTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNotify = notifyTV.dequeueReusableCell(withIdentifier: "notifycell") as! NotifyCell
        
        return cellNotify
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
