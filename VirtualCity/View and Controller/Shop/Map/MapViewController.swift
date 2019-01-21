//
//  MapViewController.swift
//  VirtualCity
//
//  Created by amir farahani on 2/12/18.
//  Copyright © 2018 amir farahani. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var ShopsInMap:[ObjectShop] = []
  var gmsMap = GMSMapView()
    var markers = [GMSMarker]()
    var shopswithLatLong:[ObjectShop] = []
   
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet var infoWin: UIView!
    @IBOutlet weak var shopIsOpen: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shopImage.layer.borderWidth = 1
        shopImage.layer.masksToBounds = false
        shopImage.layer.cornerRadius = 25.0
        shopImage.clipsToBounds = true
        self.view.addSubview(gmsMap)
        let camera = GMSCameraPosition.camera(withLatitude:35.6892 , longitude: 51.3890, zoom: 10.0)
        gmsMap.camera = camera
        gmsMap.delegate = self
        setMarker()
    }
    func setMarker(){
//        for shopvalue in ShopsInMap{
//            if (shopvalue.lat != ""){
//                let marker = GMSMarker()
//                print("lat : \(Double(shopvalue.lat)!) lng is : \(Double(shopvalue.lng)!)")
//                marker.position = CLLocationCoordinate2D(latitude: Double(shopvalue.lat)!, longitude: Double(shopvalue.lng)!)
//                marker.title = "\(shopvalue.address) \n \(shopvalue.name)"
//                marker.snippet = shopvalue.name
//              //  shopName.text = "\(shopvalue.name)"
//                shopswithLatLong.append(shopvalue)
//                markers.append(marker)
//                marker.map = self.gmsMap
//            }
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.gmsMap.frame = self.view.bounds
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
extension MapViewController :GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
       // self.gmsMap.willRemoveSubview(infoWin)
        for Shopmarker in ShopsInMap{
            
        }
        if let index = markers.index(of: marker){
           // shopName.text = shopswithLatLong[index].name
           // shopAddress.text = shopswithLatLong[index].address
            shopIsOpen.text = "باز"
             self.gmsMap.addSubview(infoWin)
        }
      
        
        
        print("marker tap : \(marker.title)")
        return false
    }
    
  
}

