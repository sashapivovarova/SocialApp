//
//  MainTabBarController.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureController()
    }
    
    //MARK: - Helpers
    func configureController() {
        view.backgroundColor = .white
        
        tabBar.backgroundColor = .white
        
        let feed = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController())
        let notification = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "love"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        let imageSelector = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "add2"), rootViewController: ImageSelectorController())
        let search = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let profile = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        
        viewControllers = [feed, notification, imageSelector, search, profile]
    }
    
    func tabBarNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        
        return nav
    }
}
