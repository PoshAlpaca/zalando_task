import Foundation

class UsersInteractor: UsersInteractorProtocol {
    var presenter: UsersPresenterProtocol?
    
    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchUsers()
                }
                
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchUsers()
                }
                return
            }
            
            // Decode JSON
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.didFetchUsers(users)
                }

            } catch let parsingError {
                print("Error while parsing json: \(parsingError)")
                
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchUsers()
                }
            }
        }
        
        task.resume()
    }
    
    func generateUsers() -> [User] {
        var users = [User]()
        
        let address = Address(street: "Main street",
                              suite: "NorthWest",
                              city: "Berlin",
                              zipcode: "33311",
                              geo: ["lat": "10", "lng": "20"])
        
        let user = User(id: 1,
                        name: "Johnny",
                        username: "johnny22",
                        email: "johnny22@gmail.com",
                        address: address,
                        posts: nil)
        
        users.append(user)
        return users
    }
}
