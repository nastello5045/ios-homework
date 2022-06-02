

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
     lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(photoImageView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPhoto(name: String){
        photoImageView.image = UIImage(named: name)
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //add photoImageView constraints
        constraints.append(photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor))
        constraints.append(photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor))
        constraints.append(photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor))
        constraints.append(photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
