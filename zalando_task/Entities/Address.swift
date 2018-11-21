struct Address {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: [String: String]
}

extension Address: Codable {}
