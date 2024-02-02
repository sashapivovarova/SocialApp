//
//  LoginViewController.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/31.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private let mainIcon: UIImageView = {
        let mi = UIImageView(image: #imageLiteral(resourceName: "Instagram_PNG-Logo-Oksdf"))
        mi.contentMode = .scaleAspectFill
        mi.tintColor = .white
        return mi
    }()
    
    private var emailTextField: UITextField = {
       let et = UITextField()
        et.textColor = .black
        et.keyboardAppearance = .dark
        et.keyboardType = .emailAddress
        et.backgroundColor = UIColor(white: 1, alpha: 0.1)
        et.setHeigth(50)
        return et
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        
        configureUI()
    }
    
    //MARK: - Heplers
    func configureUI() {
        view.backgroundColor = .black
        
        navigationController?.navigationBar.barStyle = .black
        view.addSubview(mainIcon)
        mainIcon.centerX(inview: view)
        mainIcon.setDimension(height: 60, width: 80)
        mainIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
    }
}
