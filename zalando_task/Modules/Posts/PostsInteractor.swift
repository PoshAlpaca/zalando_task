import Foundation

class PostsInteractor: PostsInteractorProtocol {
    var presenter: PostsPresenterProtocol?
    
    func fetchPosts(of user: User) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(user.id)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchPosts()
                }
                
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchPosts()
                }
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.didFetchPosts(posts)
                }
            } catch let parsingError {
                print("Error while parsing json: \(parsingError)")
                
                DispatchQueue.main.async {
                    self.presenter?.failedToFetchPosts()
                }
            }
        }
        
        task.resume()
    }
    
    func generatePosts() -> [Post] {
        var posts = [Post]()
        
        let post = Post(userId: 1,
                        id: 1,
                        title: "Some title",
                        body: "Some body")
        
        posts.append(post)
        return posts
    }
}
