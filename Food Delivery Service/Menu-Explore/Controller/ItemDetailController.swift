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
    
    @IBOutlet weak var addToOrderView: UIView!
    @IBOutlet weak var addToOrderLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var additionalRequestTextView: UITextView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var item:Item!
    var orderItem: OrderItem!
    var quantity: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        config()
        // Register Notification Center for Keyboard controller (Listen for keyboard's events)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       // print("item is: ", item.name)
    }
    
   
    private func config(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = footerView
        footerView.addSubview(additionalRequestTextView)
        tableView.tableHeaderView = headerView
        headerView.addSubview(imageView)
        
        additionalRequestTextView.delegate = self
        additionalRequestTextView.text = "No spicy, sauce in side..."
        additionalRequestTextView.textColor = UIColor.lightGray
        self.additionalRequestTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        
        let addToOrderLabelGesture = UITapGestureRecognizer(target: self, action: #selector(addToOrderLabelPressed(_ :)))
        addToOrderLabel.addGestureRecognizer(addToOrderLabelGesture)
    }
    
    private func setupUI(){
        setupAddButton()
        setupHeaderView()
    }
    
    private func setupHeaderView(){
        
        if item.imageLinks != nil && item.imageLinks.count > 0 {

                    downloadImages(imageUrls: [item.imageLinks.first!]) { (images) in
                        self.imageView.image = images.first as? UIImage
                    }
        }else{
            headerView.frame.size.height = 1;
            headerView.isHidden = true
        }
    }
    
    
    
    private func setupAddButton(){

        addToOrderView.clipsToBounds = true
        addToOrderView.layer.cornerRadius = 22
        addToOrderLabel.clipsToBounds = true
        addToOrderLabel.layer.cornerRadius = 22
        addToOrderLabel.isUserInteractionEnabled = true
        addToOrderLabel.text = "Add to Order - \(item.price * Double(quantity))"
    }

    deinit {
        // Stop listening for keyboard hide/show event
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        tableView.frame.origin.y = -300
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        tableView.frame.origin.y = 0
    }
    
    @objc func tapDone(sender: Any) {
            self.view.endEditing(true)
        }

    @objc func addToOrderLabelPressed(_ sender: UITapGestureRecognizer){
        print("Pressed")
        //TODO: - check if the user is logged in, or show login view
        print(quantity)
        //showLoginView()
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
        orderItem.quantity = quantity
        if additionalRequestTextView.text == "No spicy, sauce in side..."  {
            orderItem.specialInstruction = " "
        }else{
            orderItem.specialInstruction = additionalRequestTextView.text
        }
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
