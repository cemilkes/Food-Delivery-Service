//
//  Helpers.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/5/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import JGProgressHUD

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

private let dateFormat = "yyyyMMddHHmmss"
func dateFormatter() -> DateFormatter{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    return dateFormatter
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


func showLoadingIndicator(activityIndicator: NVActivityIndicatorView, view: UIView){
    
    if activityIndicator != nil{
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
}

func hideLoadingIndicator(activityIndicator: NVActivityIndicatorView){
    
    if activityIndicator != nil{
        activityIndicator.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}

func showHUDSuccessMessage(text: String, hud: JGProgressHUD, view:UIView){
    hud.textLabel.text = text
    hud.indicatorView = JGProgressHUDSuccessIndicatorView()
    hud.show(in: view)
    hud.dismiss(afterDelay: 3.0)
    
}

func showHUDErrorMessage(text:String, hud: JGProgressHUD, view:UIView){
    hud.textLabel.text = text
    hud.indicatorView = JGProgressHUDErrorIndicatorView()
    hud.show(in: view)
    hud.dismiss(afterDelay: 2.0)
}

func numberFormatter() -> NumberFormatter{
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.maximumIntegerDigits = 2
    nf.minimumFractionDigits = 2
    return nf
}
