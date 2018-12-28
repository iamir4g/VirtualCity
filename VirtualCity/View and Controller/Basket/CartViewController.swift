//
//  CartViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 10/7/1397 AP.
//  Copyright © 1397 amir farahani. All rights reserved.
//

import UIKit
import CoreData
class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
   
    @IBOutlet weak var tv: UITableView!
    var valueCart = [Cart]()
    override func viewDidLoad() {
        tv.delegate = self
        tv.dataSource = self
        super.viewDidLoad()
        self.setupCart()
        NotificationCenter.default.addObserver(self, selector: #selector(setupCart), name: NSNotification.Name(rawValue: "load"), object: nil)

        
        // Do any additional setup after loading the view.
    }
    @objc func setupCart(){
        self.fetchCartValue { (done) in
            if done {
                print("ok")
                DispatchQueue.main.async {
                    self.tv.reloadData()
                    //self.badge()
                }
            }
        }
        
        if let tabItems = tabBarController?.tabBar.items {
            let tabItem = tabItems[3]
            tabItem.badgeValue = "\(valueCart.count)"
        }
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        cell.name.text = valueCart[indexPath.row].name
        cell.price.text = "\(valueCart[indexPath.row].price)"
        cell.count.text = "\(valueCart[indexPath.row].number)"
        return cell
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "حذف") { (action, indexpath) in
            self.deleteData(indexPath: indexPath)
            self.setupCart()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    func fetchCartValue(completion: (_ complete: Bool) -> ()) {
        let cartManageContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        do {
            valueCart = try cartManageContext.fetch(request) as! [Cart]
            
            for vv in valueCart {
                print(vv.number)
                print(vv.id)
                print(vv.name)
            }
            
            completion(true)
            
        } catch  {
            print("Unable to fetch data: ", error)
            completion(false)
            
        }
    }

    func deleteData(indexPath: IndexPath) {
        let cartManageContext = appDelegate.persistentContainer.viewContext
        cartManageContext.delete(valueCart[indexPath.row])
        do {
            try cartManageContext.save()
            print("deleted")
            //completion(true)
        } catch {
            print("faield to ",error.localizedDescription)
            //completion(false)
        }
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

