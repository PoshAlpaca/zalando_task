import Foundation

class PostsPresenter: PostsPresenterProtocol {
    weak var view: PostsViewProtocol?
    var interactor: PostsInteractorProtocol?
    var router: PostsRouterProtocol?
    
    var user: User?
    
    func didLoadView() {
        interactor?.fetchPosts(of: user!)
    }
    
    func didFetchPosts(_ posts: [Post]) {
        self.user?.posts = posts
        view?.user = self.user
    }
    
    func failedToFetchPosts() {
        if let posts = interactor?.generatePosts() {
            self.user?.posts = posts
            view?.user = self.user
        }
    }
}
