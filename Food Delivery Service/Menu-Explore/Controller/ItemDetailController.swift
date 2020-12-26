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
    ///var orderItem: OrderItem!
    var hud: JGProgressHUD!
    
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
    
//    @objc func addToOrderLabelPressed(_ sender: UITapGestureRecognizer){
//        print("add to ORder", item.name)
//    }
//
    @objc func addToOrderLabelPressed(_ sender: UITapGestureRecognizer){
        print("Pressed")
        //TODO: - check if the user is logged in, or show login view
        showLoginView()
        createOrderItem()
        //createNewBasket()
//        downloadBasketFromFirestore("1234") { (basket) in
//            if basket == nil{
//                self.createNewBasket()
//            }else{
//                basket!.orderItemIds.append(self.orderItem.id)
//                self.updateBasket(basket: basket!, withValues: [kORDERITEMIDs:basket!.orderItemIds])
//            }
//        }
    }
    
    private func showLoginView(){
        
    }
    
    func createOrderItem(){
        
        var orderItem = OrderItem()
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
        saveBasketToFirestore(newBasket)
    }
    
    func updateBasket(basket: Basket, withValues: [String:Any]){
        
        updateBasketInFirestore(basket, withValues: withValues) { (error) in
            if error != nil {
                
                print("Error updating basket", error!.localizedDescription)
                
            }else{
                
            }
            
        }
    }
    
    func hudSuccessMessage(){}
    
}
