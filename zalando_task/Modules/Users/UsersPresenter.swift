class UsersPresenter {
    weak var view: UsersViewProtocol?
    var interactor: UsersInteractorProtocol?
    var router: UsersRouterProtocol?
}

extension UsersPresenter: UsersPresenterProtocol {
    func didLoadView() {
        interactor?.fetchUsers()
    }
    
    func didFetchUsers(_ users: [User]) {
        view?.users = users
    }
    
    func failedToFetchUsers() {
        if let users = interactor?.generateUsers() {
            view?.users = users
        }
    }
    
    func didSelectUser(_ user: User) {
        router?.presentPostsScreen(of: user)
    }
}
