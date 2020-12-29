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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addToOrderView: UIView!
    @IBOutlet weak var addToOrderLabel: UILabel!
    
    var item:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        config()
        
       // print("item is: ", item.name)
    }
    
    private func config(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let addToOrderLabelGesture = UITapGestureRecognizer(target: self, action: #selector(addToOrderLabelPressed(_ :)))
        addToOrderLabel.addGestureRecognizer(addToOrderLabelGesture)
    }
    
    private func setupUI(){
//        if item != nil{
//            self.title = item.name
//            print(item.name)
//        }
        addToOrderView.clipsToBounds = true
        addToOrderView.layer.cornerRadius = 22
        addToOrderLabel.clipsToBounds = true
        addToOrderLabel.layer.cornerRadius = 22
        addToOrderLabel.isUserInteractionEnabled = true
    }

    @objc func addToOrderLabelPressed(_ sender: UITapGestureRecognizer){
        print("Pressed")
        //TODO: - check if the user is logged in, or show login view
        showLoginView()
        createOrderItem()
        //self.dismiss(animated: true, completion: nil)
    }
    
    private func showLoginView(){
        
    }
    
    func createOrderItem(){
        
        let orderItem = OrderItem()
        orderItem.id = UUID().uuidString
        orderItem.itemId = item.id
        orderItem.ownerId = "1234"
        orderItem.quantity = 2
        orderItem.specialInstruction = "Special Instructions"
        saveItemToFirebase(orderItem)
        
        let newBasket = Basket()
        newBasket.id  = UUID().uuidString
        newBasket.ownerId = "1234"
        newBasket.orderItemIds = [orderItem.id]
        hudSuccessMessage("Added to Basket")
        
        downloadBasketFromFirestore("1234") { (basket) in
            if basket == nil{
                saveBasketToFirestore(newBasket)
            }else{
                basket!.orderItemIds.append(orderItem.id)
                self.updateBasket(basket: basket!, withValues: [kORDERITEMIDs:basket!.orderItemIds!])
            }
        }
    }
    
    func updateBasket(basket: Basket, withValues: [String:Any]){
        
        updateBasketInFirestore(basket, withValues: withValues) { (error) in
            if error != nil {
                self.hudErrorMessage(error!.localizedDescription)
            }else{
                self.hudSuccessMessage("Added to Basket")
            }
            
        }
    }

    func hudSuccessMessage(_ text: String){
        let hud = JGProgressHUD()
        hud.textLabel.text = text
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 2.0)
        
    }

    func hudErrorMessage(_ text: String){
        let hud = JGProgressHUD()
        hud.textLabel.text = text
        hud.indicatorView = JGProgressHUDErrorIndicatorView()
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 2.0)
    }
    
    
}
