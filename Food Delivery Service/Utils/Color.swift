//
//  Color.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 8/17/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit


// Usage Examples
let shadowColor = Color.shadow.value
let shadowColorWithAlpha = Color.shadow.withAlpha(0.5)
let customColorWithAlpha = Color.custom(hexString: "#123edd", alpha: 0.25).value

//https://medium.com/ios-os-x-development/a-smart-way-to-manage-colours-schemes-for-ios-applications-development-923ef976be55
enum Color {
    
    case theme
    case border
    case shadow
    
    case darkBackground
    case lightBackground
    case intermidiateBackground
    
    case whiteDarkText
    case whiteLightText
    case darkText
    case mediumGreyText
    case lightText
    case intermidiateText
    case textFieldColor
    //case placeHolderColor
    
    case affirmation
    case negation
    
    case custom(hexString: String, alpha: Double)
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}
extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {

        //Border Colour: Hair line separators in between views.
        case .border:
            instanceColor = UIColor(hexString: "#ff8c00")

        //Theme Colour. Colours on Navigation Bar, Button Titles, Progress Indicator etc.
        case .theme:
            instanceColor = UIColor(hexString: "#ff8c00")
        
        // Shadow Colour: Shadow colours for card like design.
        case .shadow:
            instanceColor = UIColor(hexString: "#d2d3d7")
        
        // Dark Background Colour: Dark background colour to group UI components with light colour.
        case .darkBackground:
            instanceColor = UIColor(hexString: "#1E2432").withAlphaComponent(0.5)
        
        //Light Background Colour: Light background colour to group UI components with dark colour.
        case .lightBackground:
            instanceColor = UIColor(hexString: "#ffffff")
        
        //Intermediate Background Colour: Used for grouping UI elements with some other colour scheme.
        case .intermidiateBackground:
            instanceColor = UIColor(hexString: "#1e2432").withAlphaComponent(0.5)
        
        case .whiteDarkText:
            instanceColor = UIColor(hexString: "ffffff")
            
        case .whiteLightText:
            instanceColor = UIColor(hexString: "#eaecef")
            
        case .darkText:
            instanceColor = UIColor(hexString: "#0a1f44")
        
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#000000")
            
        case .mediumGreyText:
            instanceColor = UIColor(hexString: "#B8BBC6")
        
        case .lightText:
            instanceColor = UIColor(hexString: "#cccccc").withAlphaComponent(0.4)
            
        case .textFieldColor:
            instanceColor = UIColor(hexString: "#8e8e93").withAlphaComponent(0.12)
        
        // Affirmation: Colour to show success, something right for user.
        case .affirmation:
            instanceColor = UIColor(hexString: "#00ff66")
        
        // Negation: Colour to show error, some danger zones for user.
        case .negation:
            instanceColor = UIColor(hexString: "#ff3300")
        
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}

extension UIColor {
    /**
     Creates an UIColor from HEX String in "#363636" format
     
     - parameter hexString: HEX String in "#363636" format
     
     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner          = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}

