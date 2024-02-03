//
//  CustomTextField.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/03.
//

import UIKit

class CustomTextField: UITextField {
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        let space = UIView()
        space.setDimension(height: 50, width: 13)
        leftView = space
        leftViewMode = .always
        
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeigth(50)
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
