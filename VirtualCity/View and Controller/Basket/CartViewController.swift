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
   
    
  // let dateAlert = UIAlertController(title: "tarikh", message: "rooz", preferredStyle: .alert)
    @IBOutlet weak var tv: UITableView!
    var valueCart = [Cart]()
    let hours = ["1","1","1","1","1","1","1",]
    var selectedHour = ""
   
    @IBOutlet weak var testTxt: UITextField!
    @IBOutlet weak var hourstxt: UITextField!
    
    var datePicker : UIDatePicker!
   // var hoursPicker : UIPickerView!
    
    override func viewDidLoad() {
        tv.delegate = self
        tv.dataSource = self
      //  testTxt.delegate = self
        super.viewDidLoad()
        self.setupCart()
        NotificationCenter.default.addObserver(self, selector: #selector(setupCart), name: NSNotification.Name(rawValue: "load"), object: nil)
     
        // Do any additional setup after loading the view.
    }
    @objc func setupCart(){
        self.fetchCartValue { (done) in
            if done {
                if valueCart.isEmpty == true {
                    self.AlertView(title: "توجه", message: "محصولی در سبد خرید وجود ندارد")
                }
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
    @IBAction func birthday(_ sender: UITextField) {
        creatDatePicker()
        if testTxt.text?.isEmpty == false {
            testTxt.text = ""
        }

    }
    @IBAction func hours(_ sender: Any) {
       creatHoursPicker()
        if hourstxt.text?.isEmpty == false {
            hourstxt.text = ""
        }
    }
    
    func creatHoursPicker(){
        // HoursPicker
        let hoursPicker = UIPickerView()
        hoursPicker.delegate = self
        self.testTxt.inputView = hoursPicker
        creatToolbarForPickerView()
    }
    func creatToolbarForPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CartViewController.dismissHoursKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        hourstxt.inputAccessoryView = toolBar
    }
    @objc func dismissHoursKeyboard() {
        view.endEditing(true)
    }
    func creatDatePicker(){
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.datePicker?.backgroundColor = UIColor.white
        self.datePicker?.datePickerMode = UIDatePickerMode.date
        self.datePicker.calendar = Calendar(identifier: Calendar.Identifier.persian)
        self.datePicker.locale = Locale(identifier: "fa_IR")
        self.testTxt.inputView = datePicker
         creatToolbarForDatePickerView()
    }
    
    func creatToolbarForDatePickerView(){
        // ToolBar
         let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CartViewController.dismissKeyBoard))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CartViewController.dismissKeyBoard))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        testTxt.inputAccessoryView = toolBar
    }
    @objc func dismissKeyBoard(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.calendar = Calendar.init(identifier: Calendar.Identifier.persian)
        dateFormatter1.locale = Locale(identifier: "fa_IR")
        testTxt.text = dateFormatter1.string(from: datePicker.date)
        view.endEditing(true)
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

extension CartViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hours.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hours[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHour = hours[row]
        hourstxt.text = selectedHour
    }
    
    
}
