//
//  ShopTableViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/2/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import ObjectMapper
import Alamofire
import SwiftyJSON


class ShopTableViewController: UIViewController , UITableViewDataSource,UITableViewDelegate ,UISearchBarDelegate{

    var Shops:[ObjectShop] = []
    var ShopsFilte : [ShopElement]!
    var NewShops : GetCategoryProductData!
    var selectesSubMenuID:Int = 0
    var shopId : Int = 0

   // @IBOutlet weak var hidinView: UIView!
    //@IBOutlet weak var indi: UIActivityIndicatorView!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var mySearch: UISearchBar!
    @IBAction func mapBtn(_ sender: Any) {
        
       self.performSegue(withIdentifier: "gotomap", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        self.mySearch.delegate = self
       //self.hidinView.isHidden = true
       // self.indi.startAnimating()
        print("cat id is : \(selectesSubMenuID)")
       // self.mySearch.enablesReturnKeyAutomatically = true
        //self.mySearch.endEditing(true)
        //self.ShopsFilte = NewShops.shops
        getAllShops(catID: selectesSubMenuID)
    }

    func getAllShops(catID:Int)  {
        let URL = "http://diar.city/api/v1/shop?sub_cat_id=\(catID)"
        Alamofire.request(URL).responseGetCategoryProductData{ respons in
            self.NewShops = respons.result.value!
        
//            for vv in self.NewShops.shops! {
//               // print("bbbb : \(vv.name)")
//            }
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
            self.ShopsFilte = self.NewShops.shops
//            switch self.NewShops.shops!.isEmpty {
//            case true:
//                print("Nothing to show")
//            case false:
//
//            default:
//                print("ridi baba!")
//            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
       
        
        return self.ShopsFilte?.count ?? 0//self.NewShops?.shops?.count ?? 0
     


      //4//ShopsFilte.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       // let cell = Bundle.main.loadNibNamed("XibTableViewCell", owner: self, options: nil) as! XibTableViewCell
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else {
           return UITableViewCell()
             }
        //let shopfordetail = NewShops.shops
       // let shopditail = ShopsFilte[indexPath.row]
        if let nameSh = self.ShopsFilte{//self.NewShops.shops {
            cell.addresshoplbl.text = nameSh[indexPath.row].address//shopfordetail![indexPath.row].address
            cell.shopnamelbl.text = nameSh[indexPath.row].name//shopfordetail![indexPath.row].name
        }
       
        
       // cell.addresslbl.text = shopditail.address
       // cell.shopnamelbl.text = shopditail.name
//       cell.shopnamelbl.text = shopditail.name
//        cell.addresshoplbl.text = shopditail.address

        return cell
    }
    // MARK: - Table View didSelected Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nameSh = self.NewShops.shops {
            self.shopId = nameSh[indexPath.row].id!
        }
        performSegue(withIdentifier: "gotoshop", sender: nil)
    }
    // MARK: - Table view Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    // MARK: - Search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            self.ShopsFilte = self.NewShops.shops//self.Shops
            myTable.reloadData()
            return
        }
        ShopsFilte = NewShops.shops?.filter({name -> Bool in
            name.address?.lowercased().contains(searchText.lowercased()) ?? false

        })
//        ShopsFilte = NewShops.shops?.filter({name -> Bool in
//
//            name.category?.lowercased().contains(searchText.lowercased()) ?? false
//
//        })
        ShopsFilte = NewShops.shops?.filter({name -> Bool in

            name.name?.lowercased().contains(searchText.lowercased()) ?? false

        })
        ShopsFilte = NewShops.shops?.filter({name -> Bool in

            name.region?.lowercased().contains(searchText.lowercased()) ?? false
        })
        

        myTable.reloadData()
    }

    // MARK: - For Hide Keyboard When Click In Search BTN
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotomap"{
           let mapView = segue.destination as! MapViewController
           // mapView.ShopsInMap = self.Shops
            print(Error.self)
        }
        else if segue.identifier == "gotoshop"{
            let shopPage = segue.destination as! MainShopViewController
            ShopID = self.shopId
        }
    }
}

class ObjectShop {
  
    var id:Int = 0
    var name:String = ""
    var category:String = ""
    var shop_type:String = ""
    var lat:String = ""
    var lng:String = ""
    var is_open:Int = 0
    var address:String = ""
    var region:String = ""
    var delivery:Int = 0
    var point_shop:Int = 1
    var sample_shop:Int = 0
    var image:String = ""
    var rate:Int = 4

    required init?(map: Map) {

    }
   init(id: Int,name: String,category: String,shop_type: String,lat: String,lng: String,is_open: Int,address: String,region: String,delivery: Int,point_shop: Int,sample_shop: Int,image: String,rate: Int) {
        self.id = id
        self.name = name
        self.category = category
        self.shop_type = shop_type
        self.lat = lat
        self.lng = lng
        self.is_open = is_open
        self.address = address
    self.region = region
    self.delivery = delivery
    self.point_shop = point_shop
    self.sample_shop = sample_shop
    self.image = image
    self.rate = rate
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        category <- map["category"]
       shop_type <- map["shop_type"]
        lat <- map["lat"]
        lng <- map["lng"]
        is_open <- map["is_open"]
        address <- map["address"]
        region <- map["region"]
        delivery <- map["delivery"]
        point_shop <- map["point_shop"]
        sample_shop <- map["sample_shop"]
        image <- map["image"]
        rate <- map["rate"]
    }
    class func  build(json:JSON)->ObjectShop {
    let id = json["id"].intValue
        let name = json["name"].stringValue
        let category = json["category"].stringValue
        let shop_type = json["shop_type"].stringValue
        let lat = json["lat"].stringValue
        let lng = json["lng"].stringValue
        let is_open = json["is_open"].intValue
        let address = json["address"].stringValue
        let region = json["region"].stringValue
        let delivery = json["delivery"].intValue
        let point_shop = json["point_shop"].intValue
        let sample_shop = json["sample_shop"].intValue
        let image = json["image"].stringValue
        let rate = json["rate"].intValue

        return ObjectShop(id: id, name: name, category: category, shop_type: shop_type, lat: lat, lng: lng, is_open: is_open, address: address, region: region, delivery: delivery, point_shop: point_shop, sample_shop: sample_shop, image: image, rate: rate)

    }
    
}

