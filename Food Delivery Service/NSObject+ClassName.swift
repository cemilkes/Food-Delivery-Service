//
//  NSObject+ClassName.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/20/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
extension NSObject{
    
    /// This function helps you avoid custom cell identifier
    ///
    ///
    /// - Returns: class name
    
    static var className: String{
        return String(describing: self)
    }
}
