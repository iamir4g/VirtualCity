//// To parse the JSON, add this file to your project and do:
////
////   let newEmpty = try? newJSONDecoder().decode(NewEmpty.self, from: jsonData)
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseNewEmpty { response in
////     if let newEmpty = response.result.value {
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
//
//public class NewEmpty: Codable {
//    public let cats: [NewCat]?
//
//    public init(cats: [NewCat]?) {
//        self.cats = cats
//    }
//}
//
////class NewEmpty: Codable {
////    cats: [NewCat]?
////}
//
//public class NewCat: Codable {
//    public let id: Int?
//    public let name: String?
//    public let menu: [NewCatMenu]?
//
//    public init(id: Int?, name: String?, menu: [NewCatMenu]?) {
//        self.id = id
//        self.name = name
//        self.menu = menu
//    }
//}
//
////class NewCat : Codable
////{
////    let id: Int?
////    let name: String?
////    let menu: [NewCatMenu]?
////}
//
//
//public class NewCatMenu: Codable {
//    public let id: Int?
//    public let name: String?
//    public let menu: NewMenuUnion?
//
//    public init(id: Int?, name: String?, menu: NewMenuUnion?) {
//        self.id = id
//        self.name = name
//        self.menu = menu
//    }
//}
//
////class NewCatMenu: Codable{
////    var id : Int?
////    var name : String?
////    var menu : NewMenuMenuClass?
////}
//
//public enum NewMenuUnion: Codable {
//    case newMenuMenuClassArray([NewMenuMenuClass])
//    case string(String)
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode([NewMenuMenuClass].self) {
//            self = .newMenuMenuClassArray(x) 
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(NewMenuUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for NewMenuUnion"))
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .newMenuMenuClassArray(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//public class NewMenuMenuClass: Codable {
//    public let id: Int?
//    public let name: String?
//
//    public init(id: Int?, name: String?) {
//        self.id = id
//        self.name = name
//    }
//}
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
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
//            return Result { try newJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//
//    @discardableResult
//    public func responseNewEmpty(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<NewEmpty>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//
//class SuperMenu {
//    var id : Int!
//    var name : String!
//    var menu : [SuperMenu]?
//    func pars(json:JSON){
//        self.id = json["id"].intValue
//        self.name = json["name"].stringValue
//        self.menu = json["menu"] as? [SuperMenu]
//    }
//}
////class SubMenu {
////    var id : Int!
////    var name : String!
////    var menu : [SubMenu]?
////    func pars(json:JSON){
////        self.id = json["id"].intValue
////        self.name = json["name"].stringValue
////        self.menu = json["menu"] as? [SubMenu]
////    }
////}
////
////class NewEmpty: Codable {
////    var cats: [NewCat]?
////}
////
////
////class NewCat : Codable
////{
////    var id: Int?
////    var name: String?
////    var menu: [NewCatMenu]?
////}
////
////class NewCatMenu: Codable{
////    var id : Int?
////    var name : String?
////    var menu : NewMenuMenuClass?
////}
////
////class NewMenuMenuClass: Codable {
////    var id : Int?
////    var menu : Int?
////
////}
