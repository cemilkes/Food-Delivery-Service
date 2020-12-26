//
//  FirebaseCollectionReference.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/20/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference:String {
    case User
    case Category
    case Items
    case Basket
    case OrderItem
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
