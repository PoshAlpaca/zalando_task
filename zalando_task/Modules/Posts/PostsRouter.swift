import UIKit

class PostsRouter: PostsRouterProtocol {
    weak var viewController: UIViewController?
    var presenter: PostsPresenterProtocol?
    
    class func buildModule(_ user: User) -> UIViewController {
        let view = PostsView()
        let interactor = PostsInteractor()
        let presenter = PostsPresenter()
        let router = PostsRouter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        presenter.user = user
        
        router.presenter = presenter
        
        return view
    }
}
