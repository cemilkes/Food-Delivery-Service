//
//  Category.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

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

}

func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void){
    
    var categoryArray: [Category] = []
    FirebaseReference(.Category).getDocuments { (snapshot, error) in
        
        guard let snapshot = snapshot else{
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            for categoryDict in snapshot.documents{
                print("Created new category")
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
            }
        }
        completion(categoryArray)
    }
    
}


func saveCategoryToFirebase(_ category: Category){
     let id = UUID().uuidString
     category.id = id
     FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
 }
 
 // Helper
 func categoryDictionaryFrom(_ category: Category) -> NSDictionary{
     return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [kCID as NSCopying, kNAME as NSCopying, kIMAGE_NAME as NSCopying])
 }
 
 func createCategorySet(){
     
     let softDrink            = Category(_name: "Soft Drink", _imageName: "softDrink")
     let appetizers           = Category(_name: "Appetizers", _imageName: "appetizers")
     let vegetarianAppetizers = Category(_name: "Vegetarian Appetizers", _imageName: "appetizers")
     let soup                 = Category(_name: "Soup", _imageName: "soup")
     let vegetarianSoup       = Category(_name: "Vegetarian Soup", _imageName: "soup")
     let salad                = Category(_name: "Salad", _imageName: "salad")
     let vegetarianEntree     = Category(_name: "Vegetarian Entree", _imageName: "salad")
     let vegetarianRiceAndNoodles = Category(_name: "Vegetarian Rice and Noodles", _imageName: "salad")
     let poultryBeefAndPork   = Category(_name: "Poultry, Beef and Pork", _imageName: "softDrink")
     let houseSpecials        = Category(_name: "House Specials", _imageName: "softDrink")
     let seaFood              = Category(_name: "SeaFood", _imageName: "seafood")
     let noodlesAndFriedRice  = Category(_name: "Noodles and Fried Rice", _imageName: "soup")
     let curry                = Category(_name: "Curry", _imageName: "curry")
     let sides                = Category(_name: "Sides", _imageName: "softDrink")
     let dessert              = Category(_name: "Dessert", _imageName: "dessert")
     
     let arrayOfCategories    = [softDrink, appetizers, vegetarianAppetizers, soup, vegetarianSoup, salad, vegetarianEntree, vegetarianRiceAndNoodles, poultryBeefAndPork, houseSpecials, seaFood, noodlesAndFriedRice, curry, sides, dessert]
     
     for category in arrayOfCategories {
         saveCategoryToFirebase(category)
     }
     
 }
