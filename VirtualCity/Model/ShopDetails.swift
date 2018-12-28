//// Generated with quicktype
//// For more options, try https://app.quicktype.io
//
//import Foundation
//
//struct TopLevel: Codable {
//    let products: [Product]
//}
//
//struct Product: Codable {
//    let id, shopID: Int
//    let name: String
//    let count: Int
//    let image: JSONNull?
//    let fromDB: Bool
//    let date: String
//    let price: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case shopID = "shop_id"
//        case name, count, image
//        case fromDB = "from_db"
//        case date, price
//    }
//}
//
//// MARK: Convenience initializers
//
//extension TopLevel {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(TopLevel.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(fromURL url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}
//
//extension Product {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Product.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(fromURL url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}
//
//// MARK: Encode/decode helpers
//
//class JSONNull: Codable {
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
