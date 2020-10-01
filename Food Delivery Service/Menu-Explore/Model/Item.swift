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

class Item{
    
    var id: String!
    var categoryId: String!
    var name:String!
    var description: String!
    var price: Double!
    var imageLinks: [String]!
    //var specialInstructions: String = ""
    //var quantity: Int
    
    
    init() {}
    
    init(_dictionary: NSDictionary) {
        
    }
    
    
}
