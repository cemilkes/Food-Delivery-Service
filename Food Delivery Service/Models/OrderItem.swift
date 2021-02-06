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
    var totalAmount: Double!
    var specialInstruction: String!
    
    init() {}
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        itemId = _dictionary[kITEMID] as? String
        ownerId = _dictionary[kOWNERID] as? String
        quantity = _dictionary[kQUANTITY] as? Int
        totalAmount = _dictionary[kORDERITEMTOTALAMOUNT] as? Double
        specialInstruction = _dictionary[kSPECIALINSTRUCTIONS] as? String
    }
}

func saveItemToFirebase(_ orderItem: OrderItem){
    
    FirebaseReference(.OrderItem).document(orderItem.id).setData(orderItemDictionaryFrom(orderItem) as! [String : Any] )
}

func orderItemDictionaryFrom(_ orderItem: OrderItem) -> NSDictionary {
    return NSDictionary(objects: [orderItem.id, orderItem.itemId, orderItem.ownerId,orderItem.quantity, orderItem.totalAmount, orderItem.specialInstruction], forKeys: [kOBJECTID as NSCopying, kITEMID as NSCopying, kOWNERID as NSCopying,  kQUANTITY as NSCopying, kORDERITEMTOTALAMOUNT as NSCopying, kSPECIALINSTRUCTIONS as NSCopying])
}

func downloadOrderItems(_ withIds: [String], completion: @escaping(_ orderItemArray: [OrderItem]) -> Void){
    print("Download order items")
    var count = 0
    var orderItemArray: [OrderItem] = []
    if withIds.count > 0 {
        for orderItemId in withIds {
            FirebaseReference(.OrderItem).document(orderItemId).getDocument { (snapshot, error) in
                guard let snapshot = snapshot else {
                    completion(orderItemArray)
                    return
                }
                if snapshot.exists {
                    orderItemArray.append(OrderItem(_dictionary: snapshot.data()! as NSDictionary))
                    count = count + 1
                    print("Download order items append")
                }else {
                    completion(orderItemArray)
                }
                
                if count  == withIds.count {
                    completion(orderItemArray)
                }
            }
        }
    }else{
        completion(orderItemArray)
    }
}

