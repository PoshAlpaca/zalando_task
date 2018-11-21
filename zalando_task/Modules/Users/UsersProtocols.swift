import UIKit

protocol UsersViewProtocol: AnyObject {
    var presenter: UsersPresenterProtocol? { get set }
    var users: [User] { get set }
}

protocol UsersInteractorProtocol: AnyObject {
    var presenter: UsersPresenterProtocol? { get set }
    
    func fetchUsers()
    func generateUsers() -> [User]
}

protocol UsersPresenterProtocol: AnyObject {
    var router: UsersRouterProtocol? { get set }
    var interactor: UsersInteractorProtocol? { get set }
    var view: UsersViewProtocol? { get set }
    
    func didLoadView()
    func didFetchUsers(_ users: [User])
    func failedToFetchUsers()
    func didSelectUser(_ user: User)
}

protocol UsersRouterProtocol: AnyObject {
    var presenter: UsersPresenterProtocol? { get set }
    
    func presentPostsScreen(of user: User)
}
