//
//  ItemDetailController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/6/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit
import JGProgressHUD

class ItemDetailController: UIViewController {
    
    var item:Item!
    var hud: JGProgressHUD!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addToBasketButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        //addToBasketButtonPressed()
        
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = item.price
        
    }
    
    private func setupUI(){
//        if item != nil{
//            self.title = item.name
//            print(item.name)
//        }
        
    }
    
    @objc func addToBasketButtonPressed(){
        
        //TODO: - check if the user is logged in, or show login view
        showLoginView()
        
        downloadBasketFromFirestore("1234") { (basket) in
            if basket == nil{
                self.createNewBasket()
            }else{
                basket!.itemIds.append(self.item.id)
                self.updateBasket(basket: basket!, withValues: [kITEMIDS:basket!.itemIds])
            }
        }
    }
    
    private func showLoginView(){
        
    }
    
    //MARK: - Add to Basket
    
    func createNewBasket(){
        
        let newBasket = Basket()
        newBasket.id  = UUID().uuidString
        newBasket.ownerId = "1234"
        newBasket.itemIds = [self.item.id]
        saveBasketToFirestore(newBasket)
        
        // Add Hud
//        self.hud.textLabel.text = "Added to basket!"
//        self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
//        self.hud.show(in: self.view)
//        self.hud.dismiss(afterDelay: 2.0)
    }
    
    func updateBasket(basket: Basket, withValues: [String:Any]){
        
        updateBasketInFirestore(basket, withValues: withValues) { (error) in
            if error != nil {
                
//                self.hud.textLabel.text = "Error: \(error!.localizedDescription)"
//                self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
//                self.hud.show(in: self.view)
//                self.hud.dismiss(afterDelay: 2.0)
                
                print("Error updating basket", error!.localizedDescription)
                
            }else{
                
//                self.hud.textLabel.text = "Added to basket!"
//                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
//                self.hud.show(in: self.view)
//                self.hud.dismiss(afterDelay: 2.0)
                
            }
            
        }
    }
    
    func hudSuccessMessage(){}
    
}
