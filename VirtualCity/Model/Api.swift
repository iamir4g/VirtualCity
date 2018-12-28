// To parse the JSON, add this file to your project and do:
//
//   let register = try? newJSONDecoder().decode(Register.self, from: jsonData)
//   let loginOrAuthenticate = try? newJSONDecoder().decode(LoginOrAuthenticate.self, from: jsonData)
//   let getUserData = try? newJSONDecoder().decode(GetUserData.self, from: jsonData)
//   let completeShopInfo = try? newJSONDecoder().decode(CompleteShopInfo.self, from: jsonData)
//   let addProductToShop = try? newJSONDecoder().decode(AddProductToShop.self, from: jsonData)
//   let getAllProductData = try? newJSONDecoder().decode(GetAllProductData.self, from: jsonData)
//   let updateUser = try? newJSONDecoder().decode(UpdateUser.self, from: jsonData)
//   let getUserSale = try? newJSONDecoder().decode(GetUserSale.self, from: jsonData)
//   let userAddressCreate = try? newJSONDecoder().decode(UserAddressCreate.self, from: jsonData)
//   let userAddressUpdate = try? newJSONDecoder().decode(UserAddressUpdate.self, from: jsonData)
//   let updateUserProfile = try? newJSONDecoder().decode(UpdateUserProfile.self, from: jsonData)
//   let getUserProfileDetail = try? newJSONDecoder().decode(GetUserProfileDetail.self, from: jsonData)
//   let getCategory = try? newJSONDecoder().decode(GetCategory.self, from: jsonData)
//   let getCategoryProductData = try? newJSONDecoder().decode(GetCategoryProductData.self, from: jsonData)
//   let getOneStoreDetail = try? newJSONDecoder().decode(GetOneStoreDetail.self, from: jsonData)
//   let shopIntroducationPage30 = try? newJSONDecoder().decode(ShopIntroducationPage30.self, from: jsonData)
//   let getLikedStore = try? newJSONDecoder().decode(GetLikedStore.self, from: jsonData)
//   let likeStore = try? newJSONDecoder().decode(LikeStore.self, from: jsonData)
//   let suggestions = try? newJSONDecoder().decode(Suggestions.self, from: jsonData)
//   let getUserTransaction = try? newJSONDecoder().decode(GetUserTransaction.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseRegister { response in
//     if let register = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseLoginOrAuthenticate { response in
//     if let loginOrAuthenticate = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetUserData { response in
//     if let getUserData = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseCompleteShopInfo { response in
//     if let completeShopInfo = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseAddProductToShop { response in
//     if let addProductToShop = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetAllProductData { response in
//     if let getAllProductData = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseUpdateUser { response in
//     if let updateUser = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetUserSale { response in
//     if let getUserSale = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseUserAddressCreate { response in
//     if let userAddressCreate = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseUserAddressUpdate { response in
//     if let userAddressUpdate = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseUpdateUserProfile { response in
//     if let updateUserProfile = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetUserProfileDetail { response in
//     if let getUserProfileDetail = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetCategory { response in
//     if let getCategory = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetCategoryProductData { response in
//     if let getCategoryProductData = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetOneStoreDetail { response in
//     if let getOneStoreDetail = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseShopIntroducationPage30 { response in
//     if let shopIntroducationPage30 = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetLikedStore { response in
//     if let getLikedStore = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseLikeStore { response in
//     if let likeStore = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseSuggestions { response in
//     if let suggestions = response.result.value {
//       ...
//     }
//   }
//
//   Alamofire.request(url).responseGetUserTransaction { response in
//     if let getUserTransaction = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

/// Register
///
/// POST https://vcity.kohastam.com/api/v1/register
class Register: Codable {
    let errorCode: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case status = "status"
    }
    
    init(errorCode: String?, status: String?) {
        self.errorCode = errorCode
        self.status = status
    }
}

/// Login or Authenticate
///
/// POST http://diar.city/api/v1/auth
class LoginOrAuthenticate: Codable {
    let token: String?
    let name: String?
    let fullName: String?
    let nationalCode: String?
    let secondEmail: String?
    let state: String?
    let city: String?
    let address: String?
    let socialNickName: JSONNull?
    let chatChannelID: String?
    let inviteCode: String?
    let avatar: String?
    let userID: Int?
    let shopID: Int?
    let likedShop: [JSONAny]?
    let ratedShop: [JSONAny]?
    let addresses: [Address]?
    let errorCode: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case name = "name"
        case fullName = "full_name"
        case nationalCode = "national_code"
        case secondEmail = "second_email"
        case state = "state"
        case city = "city"
        case address = "address"
        case socialNickName = "socialNickName"
        case chatChannelID = "chat_channel_id"
        case inviteCode = "invite_code"
        case avatar = "avatar"
        case userID = "user_id"
        case shopID = "shop_id"
        case likedShop = "liked_shop"
        case ratedShop = "rated_shop"
        case addresses = "addresses"
        case errorCode = "error_code"
        case status = "status"
    }
    
    init(token: String?, name: String?, fullName: String?, nationalCode: String?, secondEmail: String?, state: String?, city: String?, address: String?, socialNickName: JSONNull?, chatChannelID: String?, inviteCode: String?, avatar: String?, userID: Int?, shopID: Int?, likedShop: [JSONAny]?, ratedShop: [JSONAny]?, addresses: [Address]?, errorCode: String?, status: String?) {
        self.token = token
        self.name = name
        self.fullName = fullName
        self.nationalCode = nationalCode
        self.secondEmail = secondEmail
        self.state = state
        self.city = city
        self.address = address
        self.socialNickName = socialNickName
        self.chatChannelID = chatChannelID
        self.inviteCode = inviteCode
        self.avatar = avatar
        self.userID = userID
        self.shopID = shopID
        self.likedShop = likedShop
        self.ratedShop = ratedShop
        self.addresses = addresses
        self.errorCode = errorCode
        self.status = status
    }
}

class Address: Codable {
    let id: Int?
    let fullName: String?
    let state: String?
    let city: String?
    let address: String?
    let phone: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case fullName = "full_name"
        case state = "state"
        case city = "city"
        case address = "address"
        case phone = "phone"
    }
    
    init(id: Int?, fullName: String?, state: String?, city: String?, address: String?, phone: String?) {
        self.id = id
        self.fullName = fullName
        self.state = state
        self.city = city
        self.address = address
        self.phone = phone
    }
}

/// get User data
///
/// GET
///
/// http://diar.city/api/v1/auth/me?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTU3NTIxLCJleHAiOjE1NDQ5NjExMjEsIm5iZiI6MTU0NDk1NzUyMSwianRpIjoiUm9iNHFEYm14Y2ZwdW5DaSJ9.1zRqVGgEfK0vu26kfsUdVL19ErU4KstOtvuN_I8q4CU
///
/// Token Should Be change
class GetUserData: Codable {
    let name: String?
    let fullName: String?
    let phone: String?
    let email: JSONNull?
    let birthday: [String]?
    let nationalCode: String?
    let isAllowedToCall: String?
    let addresses: [Address]?
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "full_name"
        case phone = "phone"
        case email = "email"
        case birthday = "birthday"
        case nationalCode = "national_code"
        case isAllowedToCall = "is_allowed_to_call"
        case addresses = "addresses"
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(name: String?, fullName: String?, phone: String?, email: JSONNull?, birthday: [String]?, nationalCode: String?, isAllowedToCall: String?, addresses: [Address]?, status: String?, errorCode: String?) {
        self.name = name
        self.fullName = fullName
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.nationalCode = nationalCode
        self.isAllowedToCall = isAllowedToCall
        self.addresses = addresses
        self.status = status
        self.errorCode = errorCode
    }
}

/// Complete Shop Info
///
/// POST
///
/// http://diar.city/api/v1/shop?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class CompleteShopInfo: Codable {
    let shop: CompleteShopInfoShop?
    
    enum CodingKeys: String, CodingKey {
        case shop = "shop"
    }
    
    init(shop: CompleteShopInfoShop?) {
        self.shop = shop
    }
}

class CompleteShopInfoShop: Codable {
    let name: String?
    let telegram: String?
    let userID: Int?
    let phone: String?
    let mobile: String?
    let instagram: String?
    let linkedin: String?
    let facebook: String?
    let lat: String?
    let lng: String?
    let workingTime: String?
    let isOpen: Bool?
    let description: String?
    let menuItemID: String?
    let image: String?
    let shopType: String?
    let address: String?
    let region: String?
    let workingTimes: String?
    let deliveryFrom: String?
    let deliveryTo: String?
    let delivery: Bool?
    let sendTime: Bool?
    let chat: Bool?
    let call: Bool?
    let fullTime: Bool?
    let news: String?
    let guarantee: Bool?
    let change: Bool?
    let discount: Bool?
    let pointShop: Bool?
    let sampleShop: Bool?
    let minimumRequest: String?
    let updatedAt: String?
    let createdAt: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case telegram = "telegram"
        case userID = "user_id"
        case phone = "phone"
        case mobile = "mobile"
        case instagram = "instagram"
        case linkedin = "linkedin"
        case facebook = "facebook"
        case lat = "lat"
        case lng = "lng"
        case workingTime = "working_time"
        case isOpen = "is_open"
        case description = "description"
        case menuItemID = "menu_item_id"
        case image = "image"
        case shopType = "shop_type"
        case address = "address"
        case region = "region"
        case workingTimes = "working_times"
        case deliveryFrom = "delivery_from"
        case deliveryTo = "delivery_to"
        case delivery = "delivery"
        case sendTime = "send_time"
        case chat = "chat"
        case call = "call"
        case fullTime = "full_time"
        case news = "news"
        case guarantee = "guarantee"
        case change = "change"
        case discount = "discount"
        case pointShop = "point_shop"
        case sampleShop = "sample_shop"
        case minimumRequest = "minimum_request"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id = "id"
    }
    
    init(name: String?, telegram: String?, userID: Int?, phone: String?, mobile: String?, instagram: String?, linkedin: String?, facebook: String?, lat: String?, lng: String?, workingTime: String?, isOpen: Bool?, description: String?, menuItemID: String?, image: String?, shopType: String?, address: String?, region: String?, workingTimes: String?, deliveryFrom: String?, deliveryTo: String?, delivery: Bool?, sendTime: Bool?, chat: Bool?, call: Bool?, fullTime: Bool?, news: String?, guarantee: Bool?, change: Bool?, discount: Bool?, pointShop: Bool?, sampleShop: Bool?, minimumRequest: String?, updatedAt: String?, createdAt: String?, id: Int?) {
        self.name = name
        self.telegram = telegram
        self.userID = userID
        self.phone = phone
        self.mobile = mobile
        self.instagram = instagram
        self.linkedin = linkedin
        self.facebook = facebook
        self.lat = lat
        self.lng = lng
        self.workingTime = workingTime
        self.isOpen = isOpen
        self.description = description
        self.menuItemID = menuItemID
        self.image = image
        self.shopType = shopType
        self.address = address
        self.region = region
        self.workingTimes = workingTimes
        self.deliveryFrom = deliveryFrom
        self.deliveryTo = deliveryTo
        self.delivery = delivery
        self.sendTime = sendTime
        self.chat = chat
        self.call = call
        self.fullTime = fullTime
        self.news = news
        self.guarantee = guarantee
        self.change = change
        self.discount = discount
        self.pointShop = pointShop
        self.sampleShop = sampleShop
        self.minimumRequest = minimumRequest
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.id = id
    }
}

/// Add Product to shop
///
/// POST
///
/// http://diar.city/api/v1/product?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTU3NTIxLCJleHAiOjE1NDQ5NjExMjEsIm5iZiI6MTU0NDk1NzUyMSwianRpIjoiUm9iNHFEYm14Y2ZwdW5DaSJ9.1zRqVGgEfK0vu26kfsUdVL19ErU4KstOtvuN_I8q4CU
class AddProductToShop: Codable {
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: String?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get All Product Data
///
/// GET http://diar.city/api/v1/product?shop_id=56
class GetAllProductData: Codable {
    let products: [GetAllProductDataProduct]?
    
    enum CodingKeys: String, CodingKey {
        case products = "products"
    }
    
    init(products: [GetAllProductDataProduct]?) {
        self.products = products
    }
}

class GetAllProductDataProduct: Codable {
    let id: Int?
    let shopID: Int?
    let name: String?
    let count: Int?
    let image: JSONNull?
    let fromDB: Bool?
    let date: String?
    let price: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case shopID = "shop_id"
        case name = "name"
        case count = "count"
        case image = "image"
        case fromDB = "from_db"
        case date = "date"
        case price = "price"
    }
    
    init(id: Int?, shopID: Int?, name: String?, count: Int?, image: JSONNull?, fromDB: Bool?, date: String?, price: Int?) {
        self.id = id
        self.shopID = shopID
        self.name = name
        self.count = count
        self.image = image
        self.fromDB = fromDB
        self.date = date
        self.price = price
    }
}

/// Update User
///
/// PUT
///
/// http://diar.city/api/v1/update_user?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class UpdateUser: Codable {
    let shopID: Int?
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case shopID = "shop_id"
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(shopID: Int?, status: String?, errorCode: String?) {
        self.shopID = shopID
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get User Sale
///
/// GET
///
/// http://diar.city/api/v1/sale?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTU3NTIxLCJleHAiOjE1NDQ5NjExMjEsIm5iZiI6MTU0NDk1NzUyMSwianRpIjoiUm9iNHFEYm14Y2ZwdW5DaSJ9.1zRqVGgEfK0vu26kfsUdVL19ErU4KstOtvuN_I8q4CU
///
/// Response in array of sale
class GetUserSale: Codable {
    let sale: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case sale = "sale"
    }
    
    init(sale: [JSONAny]?) {
        self.sale = sale
    }
}

/// User Address Create
///
/// POST
///
/// http://diar.city/api/v1/user_address?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class UserAddressCreate: Codable {
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: String?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// User Address Update
///
/// PUT
///
/// http://diar.city/api/v1/user_address/1?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class UserAddressUpdate: Codable {
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: String?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Update User Profile
///
/// PUT
///
/// http://diar.city/api/v1/auth/me/update?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class UpdateUserProfile: Codable {
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: String?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get User profile Detail
///
/// GET
///
/// http://diar.city/api/v1/auth/me?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ0OTQ3MTU2LCJleHAiOjE1NDQ5NTA3NTYsIm5iZiI6MTU0NDk0NzE1NiwianRpIjoidVpVS0w3d002cWNaQmYwUSJ9.m84UUQDD0YUu5VsTMvNL0tRpKbosAhzdc6l6ym80wZ0
class GetUserProfileDetail: Codable {
    let name: String?
    let fullName: String?
    let phone: String?
    let email: String?
    let birthday: [String]?
    let nationalCode: String?
    let isAllowedToCall: String?
    let addresses: [Address]?
    let status: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "full_name"
        case phone = "phone"
        case email = "email"
        case birthday = "birthday"
        case nationalCode = "national_code"
        case isAllowedToCall = "is_allowed_to_call"
        case addresses = "addresses"
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(name: String?, fullName: String?, phone: String?, email: String?, birthday: [String]?, nationalCode: String?, isAllowedToCall: String?, addresses: [Address]?, status: String?, errorCode: String?) {
        self.name = name
        self.fullName = fullName
        self.phone = phone
        self.email = email
        self.birthday = birthday
        self.nationalCode = nationalCode
        self.isAllowedToCall = isAllowedToCall
        self.addresses = addresses
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get Category
///
/// GET http://diar.city/api/v1/nav_menu
///
/// get App Category
class GetCategory: Codable {
    let cats: [Cat]?
    
    enum CodingKeys: String, CodingKey {
        case cats = "cats"
    }
    
    init(cats: [Cat]?) {
        self.cats = cats
    }
}

class Cat: Codable {
    let id: Int?
    let name: String?
    let menu: [CatMenu]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case menu = "menu"
    }
    
    init(id: Int?, name: String?, menu: [CatMenu]?) {
        self.id = id
        self.name = name
        self.menu = menu
    }
}

class CatMenu: Codable {
    let id: Int?
    let name: String?
    let menu: MenuUnion?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case menu = "menu"
    }
    
    init(id: Int?, name: String?, menu: MenuUnion?) {
        self.id = id
        self.name = name
        self.menu = menu
    }
}

enum MenuUnion: Codable {
    case menuMenuClassArray([MenuMenuClass])
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([MenuMenuClass].self) {
            self = .menuMenuClassArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(MenuUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MenuUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .menuMenuClassArray(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

class MenuMenuClass: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

/// Get Category Product data
///
/// GET http://diar.city/api/v1/shop?sub_cat_id=17
class GetCategoryProductData: Codable {
    let shops: [ShopElement]?
    
    enum CodingKeys: String, CodingKey {
        case shops = "shops"
    }
    
    init(shops: [ShopElement]?) {
        self.shops = shops
    }
}

class ShopElement: Codable {
    let id: Int?
    let name: String?
    let category: Category?
    let shopType: ShopType?
    let lat: Lat?
    let lng: Lng?
    let isOpen: Int?
    let address: String?
    let region: String?
    let delivery: Int?
    let pointShop: Int?
    let sampleShop: Int?
    let image: String?
    let rate: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case category = "category"
        case shopType = "shop_type"
        case lat = "lat"
        case lng = "lng"
        case isOpen = "is_open"
        case address = "address"
        case region = "region"
        case delivery = "delivery"
        case pointShop = "point_shop"
        case sampleShop = "sample_shop"
        case image = "image"
        case rate = "rate"
    }
    
    init(id: Int?, name: String?, category: Category?, shopType: ShopType?, lat: Lat?, lng: Lng?, isOpen: Int?, address: String?, region: String?, delivery: Int?, pointShop: Int?, sampleShop: Int?, image: String?, rate: Double?) {
        self.id = id
        self.name = name
        self.category = category
        self.shopType = shopType
        self.lat = lat
        self.lng = lng
        self.isOpen = isOpen
        self.address = address
        self.region = region
        self.delivery = delivery
        self.pointShop = pointShop
        self.sampleShop = sampleShop
        self.image = image
        self.rate = rate
    }
}

enum Category: String, Codable {
    case ورزشی = "ورزشی"
}

enum Lat: String, Codable {
    case empty = ""
    case the357595244 = "35.7595244"
    case the357872251 = "35.7872251"
    case the358064826 = "35.8064826"
}

enum Lng: String, Codable {
    case empty = ""
    case the51308493 = "51.308493"
    case the51359495 = "51.359495"
    case the515722462 = "51.5722462"
}

enum ShopType: String, Codable {
    case empty = ""
    case gold = "gold"
    case normal = "normal"
    case silver = "silver"
}

/// Get One Store Detail
///
/// GET http://diar.city/api/v1/shop/81
class GetOneStoreDetail: Codable {
    let shop: GetOneStoreDetailShop?
    
    enum CodingKeys: String, CodingKey {
        case shop = "shop"
    }
    
    init(shop: GetOneStoreDetailShop?) {
        self.shop = shop
    }
}

class GetOneStoreDetailShop: Codable {
    let id: Int?
    let name: String?
    let phone: String?
    let mobile: String?
    let instagram: String?
    let telegram: String?
    let facebook: String?
    let linkedin: String?
    let lat: Lat?
    let lng: Lng?
    let workingTimeFrom: String?
    let workingTimeTo: String?
    let deliveryTimeFrom: String?
    let deliveryTimeTo: String?
    let workingTimes: [String]?
    let isOpen: Int?
    let region: String?
    let peik: JSONNull?
    let sendTime: Int?
    let chat: Int?
    let call: Int?
    let shabanehRoozi: Int?
    let news: [String]?
    let guarantee: Int?
    let change: Int?
    let discount: Int?
    let pointShop: Int?
    let sampleShop: Int?
    let minimumRequest: String?
    let about: String?
    let address: String?
    let images: [JSONAny]?
    let shopType: ShopType?
    let category: Category?
    let products: [ShopProduct]?
    let comments: [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case phone = "phone"
        case mobile = "mobile"
        case instagram = "instagram"
        case telegram = "telegram"
        case facebook = "facebook"
        case linkedin = "linkedin"
        case lat = "lat"
        case lng = "lng"
        case workingTimeFrom = "working_time_from"
        case workingTimeTo = "working_time_to"
        case deliveryTimeFrom = "delivery_time_from"
        case deliveryTimeTo = "delivery_time_to"
        case workingTimes = "working_times"
        case isOpen = "is_open"
        case region = "region"
        case peik = "peik"
        case sendTime = "send_time"
        case chat = "chat"
        case call = "call"
        case shabanehRoozi = "shabaneh_roozi"
        case news = "news"
        case guarantee = "guarantee"
        case change = "change"
        case discount = "discount"
        case pointShop = "point_shop"
        case sampleShop = "sample_shop"
        case minimumRequest = "minimum_request"
        case about = "about"
        case address = "address"
        case images = "images"
        case shopType = "shop_type"
        case category = "category"
        case products = "products"
        case comments = "comments"
    }
    
    init(id: Int?, name: String?, phone: String?, mobile: String?, instagram: String?, telegram: String?, facebook: String?, linkedin: String?, lat: Lat?, lng: Lng?, workingTimeFrom: String?, workingTimeTo: String?, deliveryTimeFrom: String?, deliveryTimeTo: String?, workingTimes: [String]?, isOpen: Int?, region: String?, peik: JSONNull?, sendTime: Int?, chat: Int?, call: Int?, shabanehRoozi: Int?, news: [String]?, guarantee: Int?, change: Int?, discount: Int?, pointShop: Int?, sampleShop: Int?, minimumRequest: String?, about: String?, address: String?, images: [JSONAny]?, shopType: ShopType?, category: Category?, products: [ShopProduct]?, comments: [JSONAny]?) {
        self.id = id
        self.name = name
        self.phone = phone
        self.mobile = mobile
        self.instagram = instagram
        self.telegram = telegram
        self.facebook = facebook
        self.linkedin = linkedin
        self.lat = lat
        self.lng = lng
        self.workingTimeFrom = workingTimeFrom
        self.workingTimeTo = workingTimeTo
        self.deliveryTimeFrom = deliveryTimeFrom
        self.deliveryTimeTo = deliveryTimeTo
        self.workingTimes = workingTimes
        self.isOpen = isOpen
        self.region = region
        self.peik = peik
        self.sendTime = sendTime
        self.chat = chat
        self.call = call
        self.shabanehRoozi = shabanehRoozi
        self.news = news
        self.guarantee = guarantee
        self.change = change
        self.discount = discount
        self.pointShop = pointShop
        self.sampleShop = sampleShop
        self.minimumRequest = minimumRequest
        self.about = about
        self.address = address
        self.images = images
        self.shopType = shopType
        self.category = category
        self.products = products
        self.comments = comments
    }
}

class ShopProduct: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let price: Int?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case price = "price"
        case count = "count"
    }
    
    init(id: Int?, name: String?, image: String?, price: Int?, count: Int?) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.count = count
    }
}

/// Shop Introducation Page30
///
/// POST
///
/// http://diar.city/api/v1/shop_introduction?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ1MzE2NDI5LCJleHAiOjE1NDUzMjAwMjksIm5iZiI6MTU0NTMxNjQyOSwianRpIjoiMHlSdU04ZFpnM3pPRHpvSSJ9.HdjJBMrOasGsVLfOhwUwlrNJxog3rQcnBxAxU97Dk-4
class ShopIntroducationPage30: Codable {
    let status: String?
    let errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: Int?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get Liked Store
///
/// GET
///
/// http://diar.city/api/v1/get_my_stores?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ1MzE2NDI5LCJleHAiOjE1NDUzMjAwMjksIm5iZiI6MTU0NTMxNjQyOSwianRpIjoiMHlSdU04ZFpnM3pPRHpvSSJ9.HdjJBMrOasGsVLfOhwUwlrNJxog3rQcnBxAxU97Dk-4
class GetLikedStore: Codable {
    let stores: [Store]?
    let status: String?
    let errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case stores = "stores"
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(stores: [Store]?, status: String?, errorCode: Int?) {
        self.stores = stores
        self.status = status
        self.errorCode = errorCode
    }
}

class Store: Codable {
    let id: Int?
    let name: String?
    let category: Category?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case category = "category"
    }
    
    init(id: Int?, name: String?, category: Category?) {
        self.id = id
        self.name = name
        self.category = category
    }
}

/// Like Store
///
/// GET
///
/// http://diar.city/api/v1/like_store/79?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ1MzE2NDI5LCJleHAiOjE1NDUzMjAwMjksIm5iZiI6MTU0NTMxNjQyOSwianRpIjoiMHlSdU04ZFpnM3pPRHpvSSJ9.HdjJBMrOasGsVLfOhwUwlrNJxog3rQcnBxAxU97Dk-4
class LikeStore: Codable {
    let status: String?
    let errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: Int?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Suggestions
///
/// POST http://diar.city/api/v1/suggestions
class Suggestions: Codable {
    let status: String?
    let errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(status: String?, errorCode: Int?) {
        self.status = status
        self.errorCode = errorCode
    }
}

/// Get User Transaction
///
/// GET
///
/// http://diar.city/api/v1/get_user_transactions?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwOi8vZGlhci5jaXR5L2FwaS92MS9hdXRoIiwiaWF0IjoxNTQ1MzE2NDI5LCJleHAiOjE1NDUzMjAwMjksIm5iZiI6MTU0NTMxNjQyOSwianRpIjoiMHlSdU04ZFpnM3pPRHpvSSJ9.HdjJBMrOasGsVLfOhwUwlrNJxog3rQcnBxAxU97Dk-4
class GetUserTransaction: Codable {
    let transactions: [Transaction]?
    let status: String?
    let errorCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
        case status = "status"
        case errorCode = "error_code"
    }
    
    init(transactions: [Transaction]?, status: String?, errorCode: Int?) {
        self.transactions = transactions
        self.status = status
        self.errorCode = errorCode
    }
}

class Transaction: Codable {
    let id: Int?
    let date: String?
    let title: String?
    let amount: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case title = "title"
        case amount = "amount"
    }
    
    init(id: Int?, date: String?, title: String?, amount: String?) {
        self.id = id
        self.date = date
        self.title = title
        self.amount = amount
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseRegister(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Register>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseLoginOrAuthenticate(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LoginOrAuthenticate>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetUserData(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetUserData>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseCompleteShopInfo(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<CompleteShopInfo>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseAddProductToShop(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<AddProductToShop>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetAllProductData(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetAllProductData>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseUpdateUser(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UpdateUser>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetUserSale(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetUserSale>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseUserAddressCreate(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UserAddressCreate>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseUserAddressUpdate(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UserAddressUpdate>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseUpdateUserProfile(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<UpdateUserProfile>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetUserProfileDetail(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetUserProfileDetail>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetCategory(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetCategory>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetCategoryProductData(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetCategoryProductData>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetOneStoreDetail(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetOneStoreDetail>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseShopIntroducationPage30(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<ShopIntroducationPage30>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetLikedStore(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetLikedStore>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseLikeStore(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<LikeStore>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseSuggestions(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Suggestions>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGetUserTransaction(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<GetUserTransaction>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
