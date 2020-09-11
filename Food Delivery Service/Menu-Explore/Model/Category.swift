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

    func createCategorySet(){
        
        let softDrink            = Category(_name: "Soft Drink", _imageName: "")
        let appetizers           = Category(_name: "Appetizers", _imageName: "")
        let vegetarianAppetizers = Category(_name: "Vegetarian Appetizers", _imageName: "")
        let soup                 = Category(_name: "Soup", _imageName: "")
        let vegetarianSoup       = Category(_name: "Vegetarian Soup", _imageName: "")
        let salad                = Category(_name: "Salad", _imageName: "")
        let vegetarianEntree     = Category(_name: "Vegetarian Entree", _imageName: "")
        let vegetarianRiceAndNoodles = Category(_name: "Vegetarian Rice and Noodles", _imageName: "")
        let poultryBeefAndPork   = Category(_name: "Poultry, Beef and Pork", _imageName: "")
        let houseSpecials        = Category(_name: "House Specials", _imageName: "")
        let seaFood              = Category(_name: "SeaFood", _imageName: "")
        let noodlesAndFriedRice  = Category(_name: "Noodles and Fried Rice", _imageName: "")
        let curry                = Category(_name: "Curry", _imageName: "")
        let sides                = Category(_name: "Sides", _imageName: "")
        let dessert              = Category(_name: "Dessert", _imageName: "")
        
    }
    
    
    
    
    
    
    
    /*
        let dict = NSMutableDictionary()
         
        dict.setObject(key, forKey:”firebaseId” as NSCopying) // add firebaseId of users dict.setObject((userValue[“username”] as! NSDictionary).value(forKey: “First-name”)!, forKey: “First-name” as NsCopying) self.arrUserList.add(dict) // list of users added in array
     
     */
    
    
}
