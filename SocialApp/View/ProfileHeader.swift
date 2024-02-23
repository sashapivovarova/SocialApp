//
//  ProfileHeader.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/19.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Properties
    private let profileImage: UIImageView = {
        let pl = UIImageView()
        pl.image = #imageLiteral(resourceName: "boston-feat")
        pl.contentMode = .scaleAspectFill
        pl.clipsToBounds = true
        return pl
    }()
    
    private let userNameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.text = "Sasha"
        lb.textColor = .black
        return lb
    }()
    
    private let profileEditButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Profile Edit", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.layer.borderWidth = 2
        bt.layer.borderColor = UIColor.lightGray.cgColor
        bt.layer.cornerRadius = 5
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        bt.addTarget(self, action: #selector(didTappedEditButton), for: .touchUpInside)
        return bt
    }()
    
    private lazy var postLabel: UILabel = {
        let pl = UILabel()
        pl.numberOfLines = 0
        pl.textAlignment = .center
        pl.attributedText = attributedText(value: 10, label: "Post")
        return pl
    }()
    
    private lazy var  followerLabel: UILabel = {
        let pl = UILabel()
        pl.numberOfLines = 0
        pl.textAlignment = .center
        pl.attributedText = attributedText(value: 100, label: "Follower")
        return pl
    }()
    
    private lazy var  followingLabel: UILabel = {
        let pl = UILabel()
        pl.numberOfLines = 0
        pl.textAlignment = .center
        pl.attributedText = attributedText(value: 100, label: "Following")
        return pl
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 13, paddingLeft: 14)
        profileImage.setDimension(height: 70, width: 70)
        profileImage.layer.cornerRadius = 70 / 2
        
        addSubview(userNameLabel)
        userNameLabel.anchor(top: profileImage.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        addSubview(profileEditButton)
        profileEditButton.anchor(top: userNameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor ,paddingTop: 15, paddingLeft: 15, paddingRight: 24)
        
        let stackView = UIStackView(arrangedSubviews: [postLabel, followerLabel, followingLabel])
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.centerY(inview: profileImage)
        stackView.anchor(left: profileImage.rightAnchor, right: rightAnchor, paddingLeft: 13, paddingRight: 13, height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc func didTappedEditButton() {
        print("DEBUG: Tapped EditButton")
    }
    
    //MARK: - Helpers
    func attributedText(value: Int, label: String) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 13), .foregroundColor: UIColor.black.cgColor])
        attr.append(NSMutableAttributedString(string: label, attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.gray.cgColor]))
        return attr
    }
}
