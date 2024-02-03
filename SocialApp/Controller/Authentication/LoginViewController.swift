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
        et.borderStyle = .none
        et.textColor = .white
        et.keyboardAppearance = .dark
        et.keyboardType = .emailAddress
        et.attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        et.backgroundColor = UIColor(white: 1, alpha: 0.1)
        et.setHeigth(50)
        return et
    }()
    
    private let passwordTextField: UITextField = {
       let pt = UITextField()
        pt.borderStyle = .none
        pt.textColor = .white
        pt.keyboardAppearance = .dark
        pt.isSecureTextEntry = true
        pt.attributedPlaceholder = NSAttributedString(string: "  Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        pt.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pt.setHeigth(50)
        return pt
    }()
    
    private let loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.layer.cornerRadius = 10
        bt.setTitle("Log In", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = #colorLiteral(red: 0.7920432687, green: 0.22240448, blue: 0.6546353698, alpha: 1)
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        bt.setHeigth(50)
        return bt
    }()
    
    private let forgotPasswordButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.attributedTitle(firstPart: "Forgot your password?", secondPart: " Reset the password")
        bt.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        return bt
    }()
    
    private let newAccount: UIButton = {
        let bt = UIButton(type: .system)
        bt.attributedTitle(firstPart: "Don't have an account?", secondPart: " Sign up")
        bt.addTarget(self, action: #selector(handleNewAccount), for: .touchUpInside)
        return bt
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        
        configureUI()
    }
    
    //MARK: - Heplers
    func configureUI() {
        navigationController?.navigationBar.barStyle = .black
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0.1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(mainIcon)
        mainIcon.centerX(inview: view)
        mainIcon.setDimension(height: 60, width: 80)
        mainIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: mainIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
        view.addSubview(newAccount)
        newAccount.centerX(inview: view)
        newAccount.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    //MARK: - Actions
    
    @objc func handleResetPassword() {
        print("Tapped, reset button")
    }
    
    @objc func handleNewAccount() {
        
    }
}
