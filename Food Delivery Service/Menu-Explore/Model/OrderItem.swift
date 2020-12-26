//
//  OrderItem.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
class OrderItem{
    
    var item: Item!
    var quantity: Int
    var specialInstruction: String
    
    init(_ item: Item) {
        quantity = 0
        specialInstruction = ""
    }
    
}
