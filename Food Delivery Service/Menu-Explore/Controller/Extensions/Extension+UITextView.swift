//
//  Extension+UITextView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/1/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func addDoneButton(title: String, target: Any, selector: Selector) {
            
            let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                                  y: 0.0,
                                                  width: UIScreen.main.bounds.size.width,
                                                  height: 44.0))//1
            let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
            let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
            toolBar.setItems([flexible, barButton], animated: false)//4
            self.inputAccessoryView = toolBar//5
        }
}

extension ItemDetailController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "No spicy, sauce in side..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    
}
