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
    
    init(_objectId: String, _email: String, _username: String) {
        objectId = _objectId
        email = _email
        username = _username
        createdAt = Date()
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
                    downloadUserFromFirestore(userId: (authDataResult?.user.uid)!, email: email)
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

    class func resetPassword(email:String, completion: @escaping (_ error: Error?) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            completion(error)
        }
    }
    class func resendVerificationEmail(email:String, completion: @escaping (_ error: Error?)->Error?){
        Auth.auth().currentUser?.reload(completion: { (error) in
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                print("Error, \(error?.localizedDescription)")
                completion(error)
            })
        })
    }
    class func logOutCurrentUser(comletion: @escaping (_ error: Error?) -> Void){
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: kCURRENTUSER)
            UserDefaults.standard.synchronize()
            //completion(nil)
        } catch let error as NSError {
            //completion(error)
        }
    }
}

func downloadUserFromFirestore(userId: String, email: String){
    
    FirebaseReference(.User).document(userId).getDocument { (snaphot, error) in
        guard let snaphot = snaphot else {return}
        
        if snaphot.exists{
            saveUserLocally(mUserDicdionary: snaphot.data()! as NSDictionary)
        }else{
            let user = MUser(_objectId: userId, _email: email, _username: "")
            saveUserLocally(mUserDicdionary: userDictionaryFrom(user: user))
            saveUserToFirebase(mUser: user)
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

func updateUserInfoInFirebase(withValues: [String:Any], completion: @escaping (_ error: Error) -> Void) {
    if let dictionary = UserDefaults.standard.object(forKey: kCURRENTUSER){
        let userObject = (dictionary as! NSDictionary).mutableCopy() as! NSMutableDictionary
        userObject.setValuesForKeys(withValues)
        
        FirebaseReference(.User).document(MUser.currentId()).updateData(withValues) {
            (error) in
            completion(error as! Error)
            
            if error == nil {
                saveUserLocally(mUserDicdionary: userObject)
            }
        }
    }
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
