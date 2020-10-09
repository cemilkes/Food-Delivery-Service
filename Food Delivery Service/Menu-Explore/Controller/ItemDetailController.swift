//
//  ItemDetailController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/6/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailController: UIViewController {
    
    
    var item:Item!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        if item != nil{
            self.title = item.name
            print(item.name)
        }
    }
    
    @objc func AddToBasketButtonPressed(){
        
        //TODO: - check if the user is logged in, or show login view
        
        downloadBasketFromFirestore("1234") { (basket) in
            if basket == nil{
                self.createNewBasket()
            }else{
                basket!.itemIds.append(self.item.id)
                self.updateBasket(basket: basket!, withValues: [kITEMIDS:basket!.itemIds])
            }
        }
    }
    
    //MARK: - Add to Basket
    
    func createNewBasket(){
        
        let newBasket = Basket()
        newBasket.id  = UUID().uuidString
        newBasket.ownerId = "1234"
        newBasket.itemIds = [self.item.id]
        saveBasketToFirestore(newBasket)
        
        // Add Hud
    
    }
    
    func updateBasket(basket: Basket, withValues: [String:Any]){
        
        updateBasketInFirestore(basket, withValues: withValues) { (error) in
                
            
        }
        
        
        
        
        
        
        
    }
    
}
