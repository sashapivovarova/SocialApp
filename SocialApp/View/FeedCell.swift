//
//  FeedCell.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/01/28.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let pf = UIImageView()
        pf.contentMode = .scaleAspectFill
        pf.clipsToBounds = true
        pf.isUserInteractionEnabled = true
        // pf.backgroundColor = .black
        pf.image = #imageLiteral(resourceName: "boston-feat")
        return pf
    }()
    
    private lazy var userName: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sasha", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return bt
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.setDimension(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(userName)
        userName.centerY(inview: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    @objc func tappedButton() {
        print("User touched button!")
    }
}
