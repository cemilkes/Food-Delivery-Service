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

        
        paymentCardTextfield.delegate = self
        paymentCardTextfield.center = self.view.center

        view.addSubview(paymentCardTextfield)
        paymentCardTextfield.becomeFirstResponder()
              
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        processCard()
    }
    private func processCard(){
        
        let cardParams = STPCardParams()
        cardParams.number = paymentCardTextfield.cardNumber
        cardParams.expMonth = UInt(paymentCardTextfield.expirationMonth)
        cardParams.expYear = UInt(paymentCardTextfield.expirationYear)
        cardParams.cvc = paymentCardTextfield.cvc
        
        STPAPIClient.shared.createToken(withCard: cardParams) { (token, error) in
            if error == nil{
                print("Token is: ", token!)
            }else{
                print("Error on processing card token", error!.localizedDescription)
            }
        }
        
    }
    
    
}
extension CardInfoController: STPPaymentCardTextFieldDelegate{
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        
        if textField.isValid {
            print("Valid info")
        }
        
    }
    
    
}
