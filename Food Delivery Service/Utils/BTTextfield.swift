//
//  BTTextfield.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/26/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class BTTextfield: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextField()
        
    }
    
    // For storyboard purpose
    // The below code is saying, thanks for all the methods and properties you have given me, but I would like to add my custom methods and properties and display them on this text field as soon as the app runs
    // required init? is specifically for UIView objects that were created through the storyboard.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupTextField()
    }
     
    func setupTextField(){
        layer.masksToBounds    = true
        layer.cornerRadius     = 22
        layer.borderColor      = UIColor.clear.cgColor
        self.font              = UIFont(name: "Avenir-Book", size: 17.0)
        backgroundColor        = Color.textFieldColor.value
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
}
