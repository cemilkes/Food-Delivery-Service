//
//  Item.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Item {
    
    var id: String!
    var categoryId: String!
    var name:String!
    var description: String!
    var price: Double!
    var imageLinks: [String]!
    
    init() {}
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        categoryId = _dictionary[kCID] as? String
        name = _dictionary[kNAME] as? String
        description = _dictionary[kDESCRIPTION] as? String
        price = _dictionary[kPRICE] as? Double
        imageLinks = _dictionary[kIMAGELINKS] as? [String]
    }
}

func saveItemToFirebase(_ item: Item){
    
    FirebaseReference(.Items).document(item.id).setData(itemDictionaryFrom(item) as! [String : Any] )

}

func itemDictionaryFrom(_ item: Item) -> NSDictionary {
    return NSDictionary(objects: [item.id, item.categoryId, item.name, item.description, item.price, item.imageLinks], forKeys: [kOBJECTID as NSCopying, kCID as NSCopying, kNAME as NSCopying, kDESCRIPTION as NSCopying, kPRICE as NSCopying, kIMAGELINKS as NSCopying])
}

//MARK: - Download Items
func downloadItemsFromFirebase(_ withCategoryId: String, completion: @escaping (_ itemArray: [Item]) -> Void){
    
    var itemArray: [Item] = []
    FirebaseReference(.Items).whereField(kCID, isEqualTo: withCategoryId).getDocuments(completion: { (snaphot, error) in
        
        guard let snaphot = snaphot else {
            completion(itemArray)
            return
        }
        if !snaphot.isEmpty{
            for itemDict in snaphot.documents {
                itemArray.append(Item(_dictionary: itemDict.data() as NSDictionary))
            }
        }
        completion(itemArray)
    })

}

func downloadItems(_ withIds: [String], completion: @escaping(_ itemArray: [Item]) -> Void){
    var count = 0
    var itemArray: [Item] = []
    if withIds.count > 0 {
        for itemId in withIds {
            FirebaseReference(.Items).document(itemId).getDocument { (snapshot, error) in
                guard let snapshot = snapshot else {
                    completion(itemArray)
                    return
                }
                if snapshot.exists {
                    itemArray.append(Item(_dictionary: snapshot.data()! as NSDictionary))
                    count = count + 1
                }else {
                    completion(itemArray)
                }
                
                if count  == withIds.count {
                    completion(itemArray)
                }
            }
        }
    }else{
        completion(itemArray)
    }
}