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
    let firstName: String
    let lastName: String
    let fullName: String
    let purchasedItemIds: [String]
    
    let fullAddress: String?
    let onBoard: Bool
    
    init(_objectId: String, _email: String, _firstName: String, _lastName: String) {
        objectId = _objectId
        email = _email
        firstName = _firstName
        lastName = _lastName
        fullName = _firstName + " " + _lastName
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
        
        if let fName = _dictionary[kFIRSTNAME] {
            firstName = fName as! String
        }else{
            firstName = ""
        }
        
        if let lName = _dictionary[kFIRSTNAME] {
            lastName = lName as! String
        }else{
            lastName = ""
        }
        
        fullName = firstName +  " " + lastName
        
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

