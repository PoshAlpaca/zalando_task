import UIKit

class PostsView: UITableViewController, PostsViewProtocol {
    var presenter: PostsPresenterProtocol?

    let cellId = "postCell"
    
    var user: User? {
        didSet {
            title = user?.name
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.didLoadView()
        
        tableView.register(PostCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostCell
        cell.post = user?.posts![indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.posts?.count ?? 0
    }
}
