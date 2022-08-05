

import UIKit

class DetailedPostViewController: UIViewController {
    
    lazy var post: Post = Post(author: "", description: "", image: "", likes: 0, views: 0)
    
    private let imageBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var postImageImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: post.image)
        return view
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.text = post.author
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = post.description
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Likes: \(post.likes)"
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: \(post.views)"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addConstraints()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(imageBackView)
        view.addSubview(postImageImageView)
        view.addSubview(authorLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(likesLabel)
        view.addSubview(viewsLabel)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            imageBackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            imageBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageBackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageBackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            postImageImageView.topAnchor.constraint(equalTo: imageBackView.topAnchor, constant: 72),
            postImageImageView.leadingAnchor.constraint(equalTo: imageBackView.leadingAnchor),
            postImageImageView.trailingAnchor.constraint(equalTo: imageBackView.trailingAnchor),
            postImageImageView.bottomAnchor.constraint(equalTo: imageBackView.bottomAnchor, constant: -72),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageBackView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            likesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            viewsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

}
