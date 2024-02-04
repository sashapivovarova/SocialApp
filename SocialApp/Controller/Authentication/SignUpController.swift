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
        bt.setTitle("SignUp", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = #colorLiteral(red: 0.5693870103, green: 0.1829448329, blue: 1, alpha: 1).withAlphaComponent(0.5)
        bt.layer.cornerRadius = 10
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        bt.addTarget(self, action: #selector(handleSignupButton), for: .touchUpInside)
        bt.isEnabled = false
        return bt
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.centerX(inview: view)
        addProfilePhotoButton.setDimension(height: 130, width: 130)
        addProfilePhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: addProfilePhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
    }
    //MARK: - Actions
    @objc func handleProfileButton() {
        print("DEBUG: addProfileButton is tapped.")
    }
    
    @objc func handleSignupButton() {
        print("DEBUG: signUpButton is tapped.")
    }
}
