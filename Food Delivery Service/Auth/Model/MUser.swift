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
    
    let fullAddress: String?
    let onBoard: Bool
    
    init(_objectId: String, _email: String, _username: String, _createdAt:Date) {
        objectId = _objectId
        email = _email
        username = _username
        createdAt = _createdAt
        fullAddress = ""
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
        
        if let usName = _dictionary[kFIRSTNAME] {
            username = usName as! String
        }else{
            username = ""
        }
        
        if let fAddress = _dictionary[kFULLADDRESS] {
            fullAddress = fAddress as! String
        }else{
            fullAddress = " "
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
    
}

