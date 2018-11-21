struct Post {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

extension Post: Codable {}
