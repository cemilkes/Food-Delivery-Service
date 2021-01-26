//
//  CardInfoController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/25/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import Stripe

class CardInfoController: UIViewController {


    let paymentCardTextfield = STPPaymentCardTextField(frame: CGRect(x: 0, y: 0, width: 300.0, height: 30.0))


    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        paymentCardTextfield.center = self.view.center
//        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
//            customView.backgroundColor = UIColor.clear
//        customView.addSubview(paymentCardTextfield)
//        paymentCardTextfield.inputAccessoryView = customView
//
        view.addSubview(paymentCardTextfield)
        paymentCardTextfield.becomeFirstResponder()
        
        
        //paymentCardTextfield.translatesAutoresizingMaskIntoConstraints = true
        
        //view.addConstraints([NSLayoutConstraint(item: paymentCardTextfield, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 30)])
        
        //view.addConstraints([NSLayoutConstraint(item: paymentCardTextfield, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20)])
        //view.addConstraints([NSLayoutConstraint(item: paymentCardTextfield, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)])
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
