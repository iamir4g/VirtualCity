//
//  ProductViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 5/27/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import XLPagerTabStrip
protocol ProCellSelect {
    func productvalue(id : Int , name :String)
}
class ProductViewController: UIViewController,IndicatorInfoProvider,UICollectionViewDelegate,UICollectionViewDataSource {
   
    var product : GetOneStoreDetailShop?

   
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Products")
    }
    
    @IBOutlet weak var productCollection: UICollectionView!

    var val:[ShopProduct]?
    override func viewDidLoad() {
        super.viewDidLoad()
       // productCount.text = "\(1)"
        getShopDetail(shopid: ShopID){aa in
            print("shop id  : \(ShopID)   count : \(aa.shop?.products?.count)")
            self.product = aa.shop
            if (aa.shop?.products?.count)! >= 1  {
                
                
            }else{
                self.AlertView(title: "توجه", message: "کالایی برای نمابش وجود ندارد")
            }
            DispatchQueue.main.async {
                self.productCollection.reloadData()
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func addToBasket(_ sender: Any) {

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.product?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let proCell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCell
       
        proCell.proNameLbl.text = product?.products?[indexPath.row].name
        proCell.proPriceLbl.text = "\(product?.products![indexPath.row].price!)"
        
        proCell.addButtonTapAction = {
            SaveCart(id:Int16(self.product!.products![indexPath.row].id!), number: Int16(proCell.procount.text!)!, price: Int16(self.product!.products![indexPath.row].price!), name: (self.product!.products![indexPath.row].name!), pic: (self.product!.products![indexPath.row].image ?? "")) { (done) in
                if done {
                    self.AlertView(title: "توجه", message:"محصول به سبد خرید اضافه شد")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)


                }else {
                    self.AlertView(title: "توجه", message:"خطایی رخ داده است")
                }
            }
        }
        return proCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //var cell : ProCellSelect
        //addToBasket(product?.products?[indexPath.row].id)
        //val?.append((product?.products?[indexPath.row])!)
       // product?.products?[indexPath.row].
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
