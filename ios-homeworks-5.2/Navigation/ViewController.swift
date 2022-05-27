//
//  ViewController.swift
//  Navigation
//
//  Created by Елена on 05.02.2022.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .darkText
        
        let feedViewController = FeedViewController()
        let logInViewController = LogInViewController()
        
        feedViewController.title = "Лента"
        logInViewController.title = "Профиль"
        
        let feedNavigationController = FeedNavigationController(rootViewController: feedViewController)
        let profileNavigationController = ProfileNavigationController(rootViewController: logInViewController)
        
        
        feedNavigationController.view.backgroundColor = .white
        feedNavigationController.navigationBar.isTranslucent = false
        profileNavigationController.view.backgroundColor = .white
        profileNavigationController.navigationBar.isTranslucent = false
        
        self.setViewControllers([feedNavigationController, profileNavigationController], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["list.dash", "person.fill"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
    }
}

