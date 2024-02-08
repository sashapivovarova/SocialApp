//
//  User.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/07.
//

import Foundation
import Firebase

struct User {
    let email: String
    var fullName: String
    var profileImageUrl: String
    var userName: String
    let uid: String
    
    var stats: UserStats!
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
//        self.fcmToken = dictionary["fcmToken"] as? String ?? ""
        
        self.stats = UserStats(followers: 0, following: 0, post: 0)
        
    }
}

struct UserStats {
    let followers: Int
    let following: Int
    let post: Int
}
