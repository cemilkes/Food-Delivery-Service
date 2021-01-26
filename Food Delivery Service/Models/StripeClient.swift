//
//  StripeClient.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/25/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import Stripe
import Alamofire

class StripeClient{
    
    static let shared = StripeClient()
    
    var baseURLString: String? = nil
    
    var baseURL: URL {
        
        if let urlString = self.baseURLString, let url = URL(string: urlString){
            return url;
        }else{
            fatalError()
        }
    }
    
    func createAndConfirmPayment(_ token: STPToken, amount: Double, completion: @escaping (_ error: Error?) -> Void) {
        
        let url = self.baseURL.appendingPathComponent("charge")
        
        let params: [String: Any] = [
            "stripeTokem": token.tokenId,
            "amount": amount,
            "description": Constats.defaultDescription,
            "currency": Constats.defaultCurrency
        ]
    
        AF.request(url, method: .post, parameters: params).validate(statusCode: 200..<300).responseData{
            (response) in
            switch response.result{
            case .success( _):
                print("payment successfull")
                completion(nil)
            case .failure(let error):
                print("Error occured", error.localizedDescription)
                completion(error)
            }
        }
        
        
        
        
    }
    
    
}
