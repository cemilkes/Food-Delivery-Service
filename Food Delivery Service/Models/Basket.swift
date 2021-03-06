//
//  Basket.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/9/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation


class Basket{
    
    var id: String!
    var ownerId: String!
    var orderItemIds: [String]!
    
    init() {
    }
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        ownerId = _dictionary[kOWNERID] as? String
        orderItemIds = _dictionary[kORDERITEMIDs] as? [String]
    }
}

//MARK: - Download

func downloadBasketFromFirestore(_ ownerId: String, completion: @escaping (_ basket: Basket?) -> Void){
    
    FirebaseReference(.Basket).whereField(kOWNERID, isEqualTo: ownerId).getDocuments { (snapshot, error) in
        
        guard let snapshot = snapshot else {
            completion(nil)
            return
        }
        
        if !snapshot.isEmpty && snapshot.documents.count > 0 {
            let basket = Basket(_dictionary: snapshot.documents.first!.data() as NSDictionary)
            completion(basket)
        }else{
            completion(nil)
        }
    }
}

//MARK: - Save

func saveBasketToFirestore(_ basket: Basket){
    FirebaseReference(.Basket).document(basket.id).setData(basketDictionaryFrom(basket) as! [String : Any])
}

//MARK: - Create Dictionary from Item

func basketDictionaryFrom(_ basket: Basket) -> NSDictionary {
    return NSDictionary(objects: [basket.id!, basket.ownerId, basket.orderItemIds!], forKeys: [kOBJECTID as NSCopying, kOWNERID as NSCopying, kORDERITEMIDs as NSCopying])
}

//MARK: - Update

func updateBasketInFirestore(_ basket: Basket, withValues: [String:Any], completion: @escaping (_ error: Error?) -> Void){
    
    FirebaseReference(.Basket).document(basket.id).updateData(withValues) { (error) in
        completion(error)
    }
    
    
}
