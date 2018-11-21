import UIKit

protocol PostsViewProtocol: AnyObject {
    var presenter: PostsPresenterProtocol? { get set }
    var user: User? { get set }
}

protocol PostsInteractorProtocol: AnyObject {
    var presenter: PostsPresenterProtocol? { get set }
    
    func fetchPosts(of user: User)
    func generatePosts() -> [Post]
}

protocol PostsPresenterProtocol: AnyObject {
    var router: PostsRouterProtocol? { get set }
    var interactor: PostsInteractorProtocol? { get set }
    var view: PostsViewProtocol? { get set }
    
    func didLoadView()
    func didFetchPosts(_ posts: [Post])
    func failedToFetchPosts()
}

protocol PostsRouterProtocol: AnyObject {
    var presenter: PostsPresenterProtocol? { get set }
}
