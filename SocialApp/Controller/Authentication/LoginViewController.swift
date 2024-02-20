//
//  LoginViewController.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/31.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel = LoginViewModel()
    
    private let mainIcon: UIImageView = {
        let mi = UIImageView(image: #imageLiteral(resourceName: "Instagram_PNG-Logo-Oksdf"))
        mi.contentMode = .scaleAspectFill
        mi.tintColor = .white
        return mi
    }()
    
    private var emailTextField: CustomTextField = {
       let et = CustomTextField(placeHolder: "Email")
        et.keyboardType = .emailAddress
        return et
    }()
    
    private let passwordTextField: CustomTextField = {
       let pt = CustomTextField(placeHolder: "Password")
        pt.isSecureTextEntry = true
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
        bt.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        bt.isEnabled = false
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
        
        configureUI()
        configureObservers()
    }
    
    //MARK: - Heplers
    func configureUI() {
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
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
    
    func configureObservers() {
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    //MARK: - Actions
    
    @objc func handleLogIn() {
        print("Tapped Log in")
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.logUserIn(withEmail: email, password: password) { (Result, error) in
            if let error = error {
                print("DEBUG: Failed to Log in \(error.localizedDescription)")

            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleResetPassword() {
        print("Tapped, reset button")
    }
    
    @objc func handleNewAccount() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textChanged(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        updateForm()
    }
}

extension LoginViewController: FormViewModel {
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsVaild
    }
}
