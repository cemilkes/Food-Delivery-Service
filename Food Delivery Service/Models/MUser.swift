//
//  MUser.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class MUser {
    
    let objectId: String
    let email: String
    let username: String
    let purchasedItemIds: [String]
    let createdAt: Date
    
    let address: String?
    let onBoard: Bool
    
    init(_objectId: String, _email: String, _username: String, _createdAt:Date) {
        objectId = _objectId
        email = _email
        username = _username
        createdAt = _createdAt
        address = ""
        onBoard = false
        purchasedItemIds = []
    }
    
    init(_dictionary: NSDictionary) {
        objectId = _dictionary[kOBJECTID] as! String
        
        if let mail = _dictionary[kEMAIL] {
            email = mail as! String
        }else{
            email = ""
        }
        
        if let usName = _dictionary[kUSERNAME] {
            username = usName as! String
        }else{
            username = ""
        }
        
        if let fAddress = _dictionary[kADDRESS] {
            address = fAddress as! String
        }else{
            address = " "
        }
        
        if let onB  = _dictionary[kONBOARD] {
            onBoard = onB as! Bool
        }else{
            onBoard = false
        }
        
        if let purchasedIds = _dictionary[kPURCHASEDITEMIDS] {
            purchasedItemIds = purchasedIds as! [String]
        }else{
            purchasedItemIds = []
        }
        
        createdAt  =  dateFormatter().date(from: _dictionary[kCREATEDAT] as! String)!
    }

    //MARK: - Return Current User

    class func currentId() -> String{
        
        return Auth.auth().currentUser!.uid
        
    }
    
    class func currentUser() -> MUser? {
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: kCURRENTUSER){
                
                return MUser.init(_dictionary: dictionary as! NSDictionary)
            }
        }
        return nil
    }
    
    class func loginWithUser(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error == nil{
                if authDataResult!.user.isEmailVerified {
                    
                    completion(error,true)
                }else{
                    print("Email is not verified")
                    completion(error, false)
                }
            }else{
                completion(error,false)
            }
        }
    }
    class func registerUserWith(email:String, password:String, completion: @escaping (_ error: Error?) -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            completion(error)
            
            if error == nil{
                authDataResult?.user.sendEmailVerification { (error) in
                    print("email verification error: ", error?.localizedDescription)
                }
            }
        }
        
        
    }
    
}

func saveUserToFirebase(mUser: MUser){
    FirebaseReference(.User).document(mUser.objectId).setData(userDictionaryFrom(user: mUser) as! [String:Any]) { (error) in
        if error != nil{
            print("error saving user \(error?.localizedDescription)")
        }
    }
}
func saveUserLocally(mUserDicdionary: NSDictionary){
    UserDefaults.standard.set(mUserDicdionary, forKey: kCURRENTUSER)
    UserDefaults.standard.synchronize()
    
}


func userDictionaryFrom(user: MUser) -> NSDictionary {
    return NSDictionary(objects:
                            [user.objectId,
                             user.email,
                             user.username,
                             user.purchasedItemIds,
                             user.createdAt,
                             user.address ?? "",
                             user.onBoard
                            ],
                        forKeys:
                            [kOBJECTID as NSCopying,
                             kEMAIL as NSCopying,
                             kUSERNAME as NSCopying,
                             kPURCHASEDITEMIDS as NSCopying,
                             kCREATEDAT as NSCopying,
                             kADDRESS as NSCopying,
                             kONBOARD as NSCopying
                            ])
}


/*
 let objectId: String
 let email: String
 let username: String
 let purchasedItemIds: [String]
 let createdAt: Date
 
 let fullAddress: String?
 let onBoard: Bool
 */
