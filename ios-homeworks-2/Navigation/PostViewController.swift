//
//  PostViewController.swift
//  Navigation
//
//  Created by Елена on 08.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    let titlePost = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.title = titlePost.post.title
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(addComment))
    }
    
  
    
    @objc private func addComment() {
        let infoViewController = InfoViewController()
        self.navigationController?.present(infoViewController, animated: true, completion: nil)
    }
}
