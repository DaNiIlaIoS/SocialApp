//
//  TabBarController.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBar()
    }
    
    private func setupViewControllers() {
        setViewControllers([setupNavigationController(rootViewController: MainViewController(), title: "Main", image: "house" , selectedImage: "house.fill"),
                            setupNavigationController(rootViewController: MessagesViewController(), title: "Message", image: "message", selectedImage: "message.fill"),
                            setupNavigationController(rootViewController: ProfileViewController(), title: "Profile", image: "person", selectedImage: "person.fill")], animated: true)
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: String,
                                           selectedImage: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        
        return navigationController
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearance
        
//        view.tintColor = .black
    }
}
