//
//  BTLabel.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit


//Delivered Fast Food to Your Door
class WelcomeLabel: UILabel {
    
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
        textColor       = Color.whiteDarkText.value
        //addTextSpacing(spacing: -0.64)
        backgroundColor = UIColor.clear
    }
    
    override var text: String? {
        set {
            welcomeLabel.text = newValue
        }
        get {
            return welcomeLabel.text
        }
    }
    
    private lazy var welcomeLabel: UILabel = {
        let label      = UILabel()
        label.font     = Font(.system(.AvenirBlack), size: .standart(.h1)).instance
        return label
    }()
    
    
    // MARK: - Letter Space
//    func addTextSpacing(spacing: CGFloat){
//        let attributedString = NSMutableAttributedString(string: self.text ?? "Test")
//        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: self.text!.count))
//        self.attributedText = attributedString
//    }
    
}

