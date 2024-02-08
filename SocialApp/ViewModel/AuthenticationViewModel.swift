//
//  AuthenticationViewModel.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/04.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsVaild: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsVaild ? #colorLiteral(red: 0.7920432687, green: 0.22240448, blue: 0.6546353698, alpha: 1) : #colorLiteral(red: 0.9177675843, green: 0.6426904798, blue: 0.9194675684, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.7)
    }
}

struct SignUpViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsVaild ? #colorLiteral(red: 0.7920432687, green: 0.22240448, blue: 0.6546353698, alpha: 1) : #colorLiteral(red: 0.9177675843, green: 0.6426904798, blue: 0.9194675684, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.7)
    }
}

struct ResetPasswordViewModel: AuthenticationViewModel {
    var email: String?
    
    var formIsVaild: Bool { return email?.isEmpty == false}
    
    var buttonBackgroundColor: UIColor {
        return formIsVaild ? #colorLiteral(red: 0.7920432687, green: 0.22240448, blue: 0.6546353698, alpha: 1) : #colorLiteral(red: 0.9177675843, green: 0.6426904798, blue: 0.9194675684, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.7)
    }
}
