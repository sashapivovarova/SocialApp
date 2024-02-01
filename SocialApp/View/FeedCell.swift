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
    
    private let feedImage: UIImageView = {
        let fd = UIImageView()
        fd.contentMode = .scaleAspectFill
        fd.clipsToBounds = true
        fd.isUserInteractionEnabled = true
        fd.image = #imageLiteral(resourceName: "boston-feat")
        return fd
    }()
    
    private lazy var likeButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "love"), for: .normal)
        bt.tintColor = .black
        return bt
    }()
    
    private lazy var captionButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "speech-bubble"), for: .normal)
        bt.tintColor = .black
        return bt
    }()
    
    private lazy var shareButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "send"), for: .normal)
        bt.tintColor = .black
        return bt
    }()
    
    private let likesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "7 likes"
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    private let captionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Ranmaru is always happy."
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    private let timeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1 day ago"
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        lb.textColor = .black
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.setDimension(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(userName)
        userName.centerY(inview: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 10)
        
        addSubview(feedImage)
        feedImage.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        feedImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - helpers
    @objc func tappedButton() {
        print("User touched button!")
    }
    
    func configureButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, captionButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: feedImage.bottomAnchor, width: 150, height: 50)
    }
}
