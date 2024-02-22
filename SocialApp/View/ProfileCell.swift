//
//  ProfileCell.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/19.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let postImageView: UIImageView = {
        let pl = UIImageView()
        pl.image = #imageLiteral(resourceName: "boston-feat")
        pl.contentMode = .scaleAspectFill
        pl.clipsToBounds = true
        return pl
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
        addSubview(postImageView)
        postImageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
