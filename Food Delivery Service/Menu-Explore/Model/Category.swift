//
//  Category.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String) {
        
        id          = ""
        name        = _name
        imageName   = _imageName
        image       = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary) {

        id      = _dictionary[kCID] as! String
        name    = _dictionary[kNAME] as! String
        image   = UIImage(named: _dictionary[kIMAGE_NAME] as? String ?? "")

    }

    /*
        let dict = NSMutableDictionary()
         
        dict.setObject(key, forKey:”firebaseId” as NSCopying) // add firebaseId of users dict.setObject((userValue[“username”] as! NSDictionary).value(forKey: “First-name”)!, forKey: “First-name” as NsCopying) self.arrUserList.add(dict) // list of users added in array
     
     */
    
    
}
