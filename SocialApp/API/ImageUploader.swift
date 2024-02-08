//
//  ImageUploader.swift
//  SocialApp
//
//  Created by Anastasia Grey on 2024/02/08.
//

import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images\(fileName)")
        
        ref.putData(imageData, metadata: nil) { StorageMetadata, error in
            if let error = error {
                print("DEBUG: Failed upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { URL, error in
                guard let imageUrl = URL?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
