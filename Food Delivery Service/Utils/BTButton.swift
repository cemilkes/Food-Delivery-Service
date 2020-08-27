//
//  BTButton.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class BTButton: UIButton {
  
    // We use override button because we want to use our custom button features instead of using UIButton
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
     
    func setupButton(){
        styleButton()
    }
    
    func styleButton(){
        
        setTitleColor(Color.whiteDarkText.value, for: .normal)
        backgroundColor     = Color.theme.value
        layer.cornerRadius  = 22
        titleLabel?.font    = Font(.system(.AvenirHeavy), size: .standart(.h6)).instance
    }

}
