
import UIKit

class InfoViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Камень судьбы", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        self.view.addSubview(self.button)
        
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc private func didTapButton() {
        let alert = UIAlertController(title: "Иванушка", message: "куда свернешь?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "налево", style: .default, handler: { _ in print("налево")}))
        alert.addAction(UIAlertAction(title: "направо", style: .default, handler: { _ in print("направо")}))
        self.present(alert, animated: true, completion: nil)
    }
}
