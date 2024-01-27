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
        
        let feed = FeedController()
        let notification = NotificationController()
        let imageSelector = ImageSelectorController()
        let search = SearchController()
        let profile = ProfileController()
        
        viewControllers = [feed, notification, imageSelector, search, profile]
    }
}
