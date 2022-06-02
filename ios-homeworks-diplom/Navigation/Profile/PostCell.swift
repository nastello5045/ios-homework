

import UIKit

class PostCell: UITableViewCell {
    
   let tap = UITapGestureRecognizer()
    
   private let authorLabel: UILabel = {
       let authorLabel = UILabel()
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
       authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
       authorLabel.textColor = .black
       authorLabel.numberOfLines = 2
       authorLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
       authorLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
       return authorLabel
    }()
    private let imageBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
       
        return view
    }()
    private let postImageImageView: UIImageView = {
        let postImageImageView = UIImageView()
        postImageImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageImageView.contentMode = .scaleAspectFit
        return postImageImageView
     }()
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return descriptionLabel
     }()
     let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .black
        likesLabel.setContentHuggingPriority(UILayoutPriority(750), for: .horizontal)
        return likesLabel
     }()
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.setContentHuggingPriority(UILayoutPriority(750), for: .horizontal)
        return viewsLabel
     }()
    
      
    private let stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        return stackView
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addConstraints()
    }
   private var likes: Int = 0
   private var views: Int = 0
    
   var likeButtonAction : (() -> ())?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosts(post: Post){
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likes = post.likes
        views = post.views
        likesLabel.text = "Likes: \(likes)"
        viewsLabel.text = "Views: \(views)"
        postImageImageView.image = UIImage(named: post.image)
        
    }
    
    func addLike(){
        likes += 1
        likesLabel.text = "Likes: \(likes)"
    }
    
    func addViews(){
        views += 1
        viewsLabel.text = "Views: \(views)"
    }
    
    private func setupViews(){
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.authorLabel)
        self.contentView.addSubview(self.imageBackView)
        self.imageBackView.addSubview(self.postImageImageView)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.stackViewLikesViews)
        self.stackViewLikesViews.addArrangedSubview(self.likesLabel)
        self.stackViewLikesViews.addArrangedSubview(self.viewsLabel)
        self.likesLabel.addGestureRecognizer(tap)
        self.tap.addTarget(self, action: #selector(likeTap))
    }
    
    @objc func likeTap(){
        likeButtonAction?()
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        
        //Add authorLabel constraints
        constraints.append(authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16))
        constraints.append(authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16))
        constraints.append(authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16))
        
        //Add imageBackView constraints
        constraints.append(imageBackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12))
        constraints.append(imageBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))
        constraints.append(imageBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))
        constraints.append(imageBackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width))
        
        //Add descriptionLabel constraints
        constraints.append(descriptionLabel.topAnchor.constraint(equalTo: imageBackView.bottomAnchor, constant: 16))
        constraints.append(descriptionLabel.bottomAnchor.constraint(equalTo: stackViewLikesViews.topAnchor, constant: -16))
        constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor))
        constraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor))
        
        //Add stackViewLikesViews constraints
        constraints.append(stackViewLikesViews.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor))
        constraints.append(stackViewLikesViews.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor))
        constraints.append(stackViewLikesViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16))
     
        //Add postImageImageView constraints
        constraints.append(postImageImageView.topAnchor.constraint(equalTo: imageBackView.topAnchor, constant: 16))
        constraints.append(postImageImageView.bottomAnchor.constraint(equalTo: imageBackView.bottomAnchor, constant: -16))
        constraints.append(postImageImageView.leadingAnchor.constraint(equalTo: imageBackView.leadingAnchor))
        constraints.append(postImageImageView.trailingAnchor.constraint(equalTo: imageBackView.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}
