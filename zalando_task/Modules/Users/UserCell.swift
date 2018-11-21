import UIKit

class UserCell: UITableViewCell {

    var user: User? {
        didSet {
            name.text = user?.name
            username.text = user?.username
            email.text = user?.email
            address.text = user?.addressString
        }
    }
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.text = "username"
        return label
    }()
    
    let email: UILabel = {
        let label = UILabel()
        label.text = "email"
        return label
    }()
    
    let address: UILabel = {
        let label = UILabel()
        label.text = "address"
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let viewList = [name, username, email, address]
        
        let stackView = UIStackView(arrangedSubviews: viewList)
        
        // Set up stackView display settings
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add margins
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        contentView.addSubview(stackView)
        
        // Set constraints
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
