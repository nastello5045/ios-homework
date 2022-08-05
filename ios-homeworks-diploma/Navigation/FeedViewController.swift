

import UIKit


class FeedViewController: UIViewController {
    struct Post {
        let title: String
    }
    
    let post = Post(title: "Уже почти")
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Нажать, чтобы найти камень судьбы", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        
        self.view.addSubview(self.button)
        
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
        
    @objc private func didTapButton() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
