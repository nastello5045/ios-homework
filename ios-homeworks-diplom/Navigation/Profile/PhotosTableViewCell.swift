

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "arrow.forward")
        view.tintColor = .black
        return view
    }()
    
    private lazy var photosStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    private lazy var photoImageView1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.image = UIImage(named: "1")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var photoImageView2: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.image = UIImage(named: "2")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var photoImageView3: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.image = UIImage(named: "3")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var photoImageView4: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.image = UIImage(named: "4")
        view.contentMode = .scaleAspectFill
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(arrowImageView)
        self.contentView.addSubview(photosStackView)
        self.photosStackView.addArrangedSubview(photoImageView1)
        self.photosStackView.addArrangedSubview(photoImageView2)
        self.photosStackView.addArrangedSubview(photoImageView3)
        self.photosStackView.addArrangedSubview(photoImageView4)
        
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //add titleLabel constraints
        constraints.append(titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12))
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12))
        
        //add arrow constraints
        constraints.append(arrowImageView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor))
        constraints.append(arrowImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12))
        
        //add photosStackView constraints
        constraints.append(photosStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12))
        constraints.append(photosStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12))
        constraints.append(photosStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12))
        constraints.append(photosStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12))
        
        //add photoImageView constraints
        constraints.append(photoImageView1.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-24)/4))
        constraints.append(photoImageView1.centerYAnchor.constraint(equalTo: self.photosStackView.centerYAnchor))
        
        constraints.append(photoImageView2.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-24)/4))
        constraints.append(photoImageView2.centerYAnchor.constraint(equalTo: self.photosStackView.centerYAnchor))
        
        constraints.append(photoImageView3.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-24)/4))
        constraints.append(photoImageView3.centerYAnchor.constraint(equalTo: self.photosStackView.centerYAnchor))
        
        constraints.append(photoImageView4.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width-24)/4))
        constraints.append(photoImageView4.centerYAnchor.constraint(equalTo: self.photosStackView.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}
