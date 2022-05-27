//
//  InfoViewController.swift
//  Navigation
//
//  Created by Елена on 08.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        self.view.addSubview(self.button)
        
        self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc private func didTapButton() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "1", style: .default, handler: { (_) in print("Сообщение 1")}))
        alert.addAction(UIAlertAction(title: "2", style: .default, handler: { (_) in print("Сообщение 2")}))
        self.present(alert, animated: true, completion: nil)
    }
}
