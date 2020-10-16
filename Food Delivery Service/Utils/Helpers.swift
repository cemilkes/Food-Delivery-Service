//
//  Helpers.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/5/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation

func convertToCurrency(_ number: Double) -> String {
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale.current
    
    let priceString = currencyFormatter.string(from: NSNumber(value: number))!
    
    return priceString
}

func convertCurrencyToDouble(input: String) -> Double? {
     let numberFormatter = NumberFormatter()
     numberFormatter.numberStyle = .currency
     numberFormatter.locale = Locale.current
     return numberFormatter.number(from: input)?.doubleValue
}
