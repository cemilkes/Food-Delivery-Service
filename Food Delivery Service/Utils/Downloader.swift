//
//  Downloader.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/24/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import FirebaseStorage

let storage = Storage.storage()
                                                      //Callback block - since uploading images happening on background thread
func uploadImages(images: [UIImage?], itemId: String, completion: @escaping (_ imageLinks: [String]) -> Void) {
    
    if Reachability.HasConnection() {
        
        var uploadedImagesCount = 0
        
        var imageLinkArray: [String] = []
        
        // When we choose an image from user gallery, the image doesn't have any name so we put suffix to named and find the images easily on Firebase Storage.
        var nameSuffix = 0
        
        for image in images {
            
            //Folder and file name for image storages.
            let fileName = "ItemImages/" + itemId + "/" + "\(nameSuffix)" + ".jpg"
            
            //Converting image type to data type(jpeg)
            let imageData = image!.jpegData(compressionQuality: 0.5)
            
            saveImageInFirebase(imageData: imageData!, fileName: fileName) { (imageLink) in
                         
                         if imageLink != nil {
                             
                             imageLinkArray.append(imageLink!)
                             
                             uploadedImagesCount += 1
                             
                             if uploadedImagesCount == images.count {
                                 completion(imageLinkArray)
                             }
                         }
                     }
            nameSuffix += 1
        }
        
    } else {
        print("No Internet Connection")
    }
}

func saveImageInFirebase(imageData: Data, fileName: String, completion: @escaping (_ imageLink: String?) -> Void) {
    
    var task: StorageUploadTask!
    
    let storageRef = storage.reference(forURL: kFILEREFERENCE).child(fileName)
    
    task = storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
            
            task.removeAllObservers()
            
            if error != nil {
                print("Error uploading image", error!.localizedDescription)
                completion(nil)
                return
            }
            
            storageRef.downloadURL { (url, error) in
                
                guard let downloadUrl = url else {
                    completion(nil)
                    return
                }
                
                completion(downloadUrl.absoluteString)
            }
        })

}
