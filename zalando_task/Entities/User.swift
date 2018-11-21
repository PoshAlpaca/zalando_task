struct User {
    var id: Int
    var name: String
    var username: String
    var email: String
    var addressString: String {
        return address.street + "\n" + address.suite + "\n" + address.city + "\n" + address.zipcode
    }
    var address: Address
    var posts: [Post]?
}

extension User: Codable {}
