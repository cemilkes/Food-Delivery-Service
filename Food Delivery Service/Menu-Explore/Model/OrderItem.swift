//
//  OrderItem.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
class OrderItem{
    
    var id: String!
    var itemId: String!
    var ownerId: String!
    var quantity: Int!
    var specialInstruction: String!
    
    init() {}
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        itemId = _dictionary[kITEMID] as? String
        ownerId = _dictionary[kOWNERID] as? String
        quantity = _dictionary[kQUANTITY] as? Int
        specialInstruction = _dictionary[kSPECIALINSTRUCTIONS] as? String
    }
}

func saveItemToFirebase(_ orderItem: OrderItem){
    
    FirebaseReference(.OrderItem).document(orderItem.id).setData(orderItemDictionaryFrom(orderItem) as! [String : Any] )
}

func orderItemDictionaryFrom(_ orderItem: OrderItem) -> NSDictionary {
    return NSDictionary(objects: [orderItem.id, orderItem.itemId, orderItem.ownerId,orderItem.quantity, orderItem.specialInstruction], forKeys: [kOBJECTID as NSCopying, kITEMID as NSCopying, kOWNERID as NSCopying,  kQUANTITY as NSCopying, kSPECIALINSTRUCTIONS as NSCopying])
}
