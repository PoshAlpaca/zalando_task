import UIKit

class UsersRouter: UsersRouterProtocol {
    weak var navController: UINavigationController?
    var presenter: UsersPresenterProtocol?
    
    class func buildModule() -> UIViewController {
        
        // Initialize module components
        let view = UsersView()
        let interactor = UsersInteractor()
        let presenter = UsersPresenter()
        let router = UsersRouter()
        
        let navController = UINavigationController(rootViewController: view)
        
        // Connect module components
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.navController = navController
        router.presenter = presenter
        
        return navController
    }
    
    func presentPostsScreen(of user: User) {
        let postsView = PostsRouter.buildModule(user)
        
        navController?.pushViewController(postsView, animated: true)
    }
}
