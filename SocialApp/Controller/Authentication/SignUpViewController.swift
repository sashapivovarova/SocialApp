//
//  SignUpController.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/31.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel = SignUpViewModel()
    private var profileImage: UIImage?
    
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
        bt.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        bt.setHeigth(50)
        bt.isEnabled = false
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
        configureObservers()
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
    
    func configureObservers() {
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    //MARK: - Actions
    @objc func handleProfileButton() {
        let selectPhoto = UIImagePickerController()
        selectPhoto.delegate = self
        selectPhoto.allowsEditing = true
        
        present(selectPhoto, animated: true, completion: nil)
    }
    
    @objc func handleSignup() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credential = AuthCredentials(email: email, password: password, fullName: fullName, userName: userName, profileImage: profileImage)
        AuthService.signUpUser(withCredential: credential) { error in
            
            
            if let errorr = error {
                print("DEBUG: Failed to SignUp \(error?.localizedDescription)")
            }
            print("DEBUG: SignUp is Successful!")
        }
    }
    
    @objc func handleAlreadyAccount() {
        let controller = LoginViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textChanged(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else {
            viewModel.userName = sender.text
        }
        
        updateForm()
    }
}

extension SignUpViewController: FormViewModel {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsVaild
    }
}

//MARK: - UIImagePickerControllerDelegate
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage
        
        addProfilePhotoButton.contentMode = .scaleAspectFill
        addProfilePhotoButton.clipsToBounds = true
        addProfilePhotoButton.layer.cornerRadius = addProfilePhotoButton.frame.width / 2
        addProfilePhotoButton.layer.masksToBounds = true
        addProfilePhotoButton.layer.borderColor = UIColor.yellow.cgColor
        addProfilePhotoButton.layer.borderWidth = 2
        addProfilePhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
