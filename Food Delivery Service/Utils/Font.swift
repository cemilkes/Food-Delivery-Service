//
//  Font.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 8/17/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit
//https://medium.com/@sauvik_dolui/handling-fonts-in-ios-development-a-simpler-way-32d360cdc1b6
struct Font {
   
    enum FontType {
        case system(FontName)
        case custom(String)
    }
    
    enum FontSize {
          case standart(StandardSize)
          case custom(Double)
          var value: Double{
              switch self {
              case .standart(let size):
                  return size.rawValue
              case .custom(let customSize):
                  return customSize
              }
          }
    }
    
    enum FontName: String {
        
        case AvenirBook      = "Avenir-Book"
        case AvenirHeavy     = "Avenir-Heavy"
        case AvenirMedium    = "Avenir-Medium"
        case AvenirBlack     = "Avenir-Black"
    }
    
    enum StandardSize: Double {
        case h0     = 44.0
        case h1     = 40.0
        case h2     = 34.0
        case h3     = 28.0
        case h4     = 22.0
        case h5     = 20.0
        case h6     = 17.0
        case h7     = 15.0
        case h8     = 13.0
        case h9     = 11.0
    }
    
    var type: FontType
    var size: FontSize
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
    
}
extension Font{
    
    var instance: UIFont {
        
        var instanceFont: UIFont!
        switch type {
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        }
        return instanceFont
    }
}
