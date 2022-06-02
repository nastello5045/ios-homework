

import UIKit

class PhotosViewController: UIViewController {

    
    private lazy var layout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        let width = (view.frame.size.width - 40)/3
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.alpha = 0
        return view
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tintColor = .white
        button.setBackgroundImage(UIImage(systemName: "multiply"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    private var dataSource: [String] = []
    
    var isCellExpanded: Bool = false
    
    var endFrame: CGRect = CGRect()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos Gallery"
        dataSource = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
        view.addSubview(collectionView)
        view.addSubview(backView)
        view.addSubview(photoImageView)
        view.addSubview(exitButton)
        photoImageView.alpha = 0
        addConstraints()
    }
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //add collectionView constraints
        constraints.append(collectionView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        //Add exitButton constraints
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        constraints.append(exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 45))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 45))
        
        //Add backView constraints
        constraints.append(backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func didTapExitButton() {
        self.isCellExpanded = false
//        self.photoImageView.frame = endFrame
//        self.photoYConstraint?.isActive = self.isCellExpanded ? true : false
//        self.photoHeightConstraint?.isActive = self.isCellExpanded ? true : false
//        self.photoLeadingConstraint?.isActive = self.isCellExpanded ? true : false
//        self.photoTrailingConstraint?.isActive = self.isCellExpanded ? true : false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.photoImageView.frame = self.isCellExpanded ? UIScreen.main.bounds:self.endFrame
            self.view.layoutIfNeeded()
            self.backView.alpha = 0
            self.exitButton.alpha = 0
            self.navigationItem.hidesBackButton = false
        }, completion: {_ in self.photoImageView.alpha = 0})
    }

}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! CollectionViewCell
        cell.setPhoto(name: dataSource[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        isCellExpanded = true
        self.photoImageView.image = cell.photoImageView.image
        self.photoImageView.alpha = 1
        if let startingFrame = cell.superview?.convert(cell.frame, to: nil){
            self.photoImageView.frame = startingFrame
            self.endFrame = startingFrame
            self.navigationItem.hidesBackButton = true
        }
        UIView.animate(withDuration: 0.5,animations: {
            self.photoImageView.frame = self.isCellExpanded ? CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width):self.endFrame
            self.photoImageView.center = self.view.center
            self.backView.alpha = 0.5
            self.exitButton.alpha = 1
            self.view.layoutIfNeeded()
        })
        }
    
}


