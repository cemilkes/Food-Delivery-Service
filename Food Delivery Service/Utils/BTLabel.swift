//
//  BTLabel.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit


enum AuthLabel {
    case darkTitle
    case lightTitle
    case intermediateTitle
}

class BTLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
        
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLabel()
    }
     
    func setupLabel(){
        
        backgroundColor = UIColor.clear
        numberOfLines   = 0
        lineBreakMode   = NSLineBreakMode.byWordWrapping

     }

}

class DarkTitleLabel: BTLabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDarkTitleLabel()
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDarkTitleLabel()
    }
    
    func setupDarkTitleLabel(){
        textColor       = Color.darkText.value
        font            = Font(.system(.AvenirBlack), size: .standart(.h2)).instance
    }
}

class LightTextLabel: BTLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLightTextLabel()
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLightTextLabel()
    }
    
    func setupLightTextLabel(){
        textColor       = Color.intermidiateText.value
        font            = Font(.system(.AvenirBlack), size: .standart(.h6)).instance
    }
}

class PlaceHolderTextLabel: BTLabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlaceHolderTextLabel()
    }
    
    // For storyboard purpose
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPlaceHolderTextLabel()
    }
    
    func setupPlaceHolderTextLabel(){
        textColor       = Color.lightText.value
        font            = Font(.system(.AvenirBlack), size: .standart(.h6)).instance
    }
    
    
    
}




     //addTextSpacing(spacing: -0.64)
    
//    override var text: String? {
//        set {
//            welcomeLabel.text = newValue
//        }
//        get {
//            return welcomeLabel.text
//        }
//    }
//
//    private lazy var welcomeLabel: UILabel = {
//        let label      = UILabel()
//        label.font     = Font(.system(.AvenirBlack), size: .standart(.h0)).instance
//        return label
//    }()
    
    
    // MARK: - Letter Space
//    func addTextSpacing(spacing: CGFloat){
//        let attributedString = NSMutableAttributedString(string: self.text ?? "Test")
//        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: self.text!.count))
//        self.attributedText = attributedString
//    }
    
