//// To parse the JSON, add this file to your project and do:
////
////   let shops = try? newJSONDecoder().decode(Shops.self, from: jsonData)
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseShops { response in
////     if let shops = response.result.value {
////       ...
////     }
////   }
////
//// Hashable or Equatable:
//// The compiler will not be able to synthesize the implementation of Hashable or Equatable
//// for types that require the use of JSONAny, nor will the implementation of Hashable be
//// synthesized for types that have collections (such as arrays or dictionaries).
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//public struct Shops: Codable, Equatable {
//    public let shops: [Shop]?
//    
//    public init(shops: [Shop]?) {
//        self.shops = shops
//    }
//}
//
//public struct Shop: Codable, Equatable {
//    public let id: Int?
//    public let name, category: String?
//    public let shopType, lat, lng: String?
//    public let isOpen: Int?
//    public let address: String?
//    public let region: String?
//    public let delivery, pointShop, sampleShop: Int?
//    public let image: String?
//    public let rate: Double?
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name, category
//        case shopType = "shop_type"
//        case lat, lng
//        case isOpen = "is_open"
//        case address, region, delivery
//        case pointShop = "point_shop"
//        case sampleShop = "sample_shop"
//        case image, rate
//    }
//    
//    public init(id: Int?, name: String?, category: String?, shopType: String?, lat: String?, lng: String?, isOpen: Int?, address: String?, region: String?, delivery: Int?, pointShop: Int?, sampleShop: Int?, image: String?, rate: Double?) {
//        self.id = id
//        self.name = name
//        self.category = category
//        self.shopType = shopType
//        self.lat = lat
//        self.lng = lng
//        self.isOpen = isOpen
//        self.address = address
//        self.region = region
//        self.delivery = delivery
//        self.pointShop = pointShop
//        self.sampleShop = sampleShop
//        self.image = image
//        self.rate = rate
//    }
//}
//
//func ShopsJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func ShpsJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - Alamofire response handlers
//
//public extension DataRequest {
//    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
//        return DataResponseSerializer { _, response, data, error in
//            guard error == nil else { return .failure(error!) }
//            
//            guard let data = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//            
//            return Result { try ShopsJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//    
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//    
//    @discardableResult
//    public func responseShops(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Shops>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//
