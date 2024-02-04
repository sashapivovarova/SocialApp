//
//  SignUpController.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/31.
//

import UIKit

class SignUpController: UIViewController {
    
    //MARK: - Properties
    private let addProfilePhotoButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "add2"), for: .normal)
        bt.tintColor = .white
        bt.addTarget(self, action: #selector(handleProfileButton), for: .touchUpInside)
        return bt
    }()
    
    private let emailTextField: CustomTextField = {
        let et = CustomTextField(placeHolder: "Email")
        et.keyboardType = .emailAddress
        return et
    }()
    
    private let passwordTextField: CustomTextField = {
        let pt = CustomTextField(placeHolder: "Password")
        pt.isSecureTextEntry = true
        return pt
    }()
    
    private let fullNameTextField = CustomTextField(placeHolder: "FullName")
    private let userNameTextField = CustomTextField(placeHolder: "Username")
    
    private let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign Up", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = #colorLiteral(red: 0.7920432687, green: 0.22240448, blue: 0.6546353698, alpha: 1)
        bt.layer.cornerRadius = 10
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        bt.addTarget(self, action: #selector(handleSignupButton), for: .touchUpInside)
        bt.setHeigth(50)
        bt.isEnabled = true
        return bt
    }()
    
    private let alreadyAccountButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.attributedTitle(firstPart: "Already have an account?", secondPart: " Log In")
        bt.addTarget(self, action: #selector(handleAlreadyAccount), for: .touchUpInside)
        return bt
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        
        configureGradientLayer()
        
        view.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.centerX(inview: view)
        addProfilePhotoButton.setDimension(height: 130, width: 130)
        addProfilePhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: addProfilePhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
        view.addSubview(alreadyAccountButton)
        alreadyAccountButton.centerX(inview: view)
        alreadyAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    //MARK: - Actions
    @objc func handleProfileButton() {
        print("DEBUG: addProfileButton is tapped.")
    }
    
    @objc func handleSignupButton() {
        print("DEBUG: signUpButton is tapped.")
    }
    
    @objc func handleAlreadyAccount() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
