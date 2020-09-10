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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextField()
        
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupTextField()
    }
     
    func setupTextField(){}
    
    
}
