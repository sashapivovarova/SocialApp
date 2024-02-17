//
//  AuthService.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/08.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}

struct AuthService {
    static func signUpUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                if let error = error {
                    print("DEBUG: Failed to SignUp \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                var data: [String: Any] = ["email": credentials.email,
                                           "fullName": credentials.fullName,
                                           "profileImage": credentials.profileImage,
                                           "uid": uid,
                                           "userName": credentials.userName]
                
                Firestore.firestore().collection("Users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
