//
//  OrderController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/9/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD
import Stripe

class OrderController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var taxAndFeesTotalLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var basketTotalSummaryView: UIView!
    
    let hud = JGProgressHUD(style: .dark)
    var basket: Basket?
    var allItems: [OrderItem] = []
    var purchasedItemIds : [String] = []
    var tax: Double = 0
    var deliveryFee: Double = 0
    
    var totalPrice = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBasketFromFirestore()
        setupUI()
    }

    private func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self

        continueView.layer.cornerRadius = 8
        continueButtonOutlet.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if MUser.currentUser() != nil{
            loadBasketFromFirestore()
        }else{
            self.updateTotalLabels(true)
        }
        
        
        checkoutButtonStatusUpdate()
        // Check if the user is logged in
        
    }
    
    //MARK: - Download Basket
    
    func loadBasketFromFirestore(){
        
        //1234 -> MUser.currentId()
        downloadBasketFromFirestore(MUser.currentId()){ (basket) in
            self.basket = basket
            self.getBasketItems()
        }
    }
    
    func getBasketItems(){
        
        if basket != nil {
            downloadOrderItems(basket!.orderItemIds){ (allItems) in
                self.allItems = allItems
                self.updateTotalLabels(false)
            }
        }
        self.tableView.reloadData()
    }
    
    private func updateTotalLabels(_ isEmpty: Bool) {
        if isEmpty {
            subTotalLabel.text = returnBasketTotalPrice()
            
        }else{
            subTotalLabel.text = returnBasketTotalPrice()
            taxAndFeesTotalLabel.text = "\(tax)"
        }
    }
    
    private func returnBasketTotalPrice() -> String {
        
        var totalPrice = 0.0
        
        for orderItem in allItems {
            totalPrice = totalPrice + orderItem.totalAmount
        }
        tax = Double(totalPrice * 9.25 / 100).rounded(toPlaces: 2)
        print(totalPrice)
        return convertToCurrency(totalPrice)
        
    }

    private func checkoutButtonStatusUpdate(){
        
        continueButtonOutlet.isEnabled = allItems.count > 0
        
        if continueButtonOutlet.isEnabled {
            continueButtonOutlet.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }else{
            disableContinueButton()
        }
    }
    
    private func disableContinueButton(){
        continueButtonOutlet.isEnabled = false
        continueButtonOutlet.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    func removeItemFromBasket(orderItemId: String){
        
        for i in 0..<basket!.orderItemIds.count {
            if orderItemId == basket!.orderItemIds[i] {
                basket?.orderItemIds.remove(at: i)
                return 
            }
        }
    }
    
    @IBAction func ContinueButtonPressed(_ sender: UIButton) {
        if MUser.currentUser()  != nil {
            // proceed to purchase
//            temp()
//            addItemsToPurchaseHistory(self.purchasedItemIds)
//            emptyBasket()
//            basketTotalSummaryView.isHidden = true
            showPaymentOptions()
        }else{
             // hud - complete registiration- error
            print("Error")
            showHUDErrorMessage(text: "Error occured, please try again later.", hud: self.hud, view: self.view)
        }
    }
    
    private func emptyBasket(){
        purchasedItemIds.removeAll()
        allItems.removeAll()
        tableView.reloadData()
        
        basket!.orderItemIds = []
        updateBasketInFirestore(basket!, withValues: [kORDERITEMIDs: basket!.orderItemIds]) { (error) in
            if error != nil{
                print("Error updating basket ", error!.localizedDescription)
            }
            self.getBasketItems()
        }
    }
    
    private func addItemsToPurchaseHistory(_ orderItemIds: [String]){
    
        if MUser.currentUser() != nil {
            let newOrderItemIds = MUser.currentUser()!.purchasedItemIds + orderItemIds
            updateUserInfoInFirebase(withValues: [kPURCHASEDITEMIDS: newOrderItemIds]) { (error) in
                if error != nil{
                    //print("Error adding purchased items ", error.localizedDescription)
                    showHUDErrorMessage(text: error.localizedDescription, hud: self.hud, view: self.view)
                }
            }
        }
    }
    
    func temp(){
        for orderItem in allItems{
            purchasedItemIds.append(orderItem.id)
        }
    }
    
    private func completePayment(token: STPToken){
        
        self.totalPrice = 0.0
        for orderItem in allItems {
            purchasedItemIds.append(orderItem.id)
            self.totalPrice = orderItem.totalAmount
        }
        self.totalPrice = totalPrice * 100.0
        StripeClient.shared.createAndConfirmPayment(token, amount: totalPrice) { (error) in
            if error == nil{
                self.emptyBasket()
                self.addItemsToPurchaseHistory(self.purchasedItemIds)
                showHUDSuccessMessage(text: "Payment Successful", hud: self.hud, view: self.view)
            }else{
                print("Error", error!.localizedDescription)
                showHUDErrorMessage(text: error!.localizedDescription, hud: self.hud, view: self.view)
            }
        }
    }
    
    private func showPaymentOptions(){
        
        let alertController = UIAlertController(title: "Payment Options", message: "Choose Prefered Payment Option", preferredStyle: .actionSheet)
        
        let cardAction = UIAlertAction(title: "Pay with Card", style: .default) { (action) in
            
            //show card number view
            let vc = UIStoryboard.init(name: Storyboard.order, bundle: nil).instantiateViewController(identifier: "CardInfoController") as! CardInfoController
            self.present(vc, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cardAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    func showItemView(withItem: OrderItem) {
//        let itemVC = UIStoryboard.init(name: Storyboard.menu, bundle: nil).instantiateViewController(identifier: ViewController.itemDetailController) as! ItemDetailController
//        itemVC.quantity = withItem.quantity
//        present(itemVC, animated: true, completion: nil)
//        itemVC.modalPresentationStyle = .formSheet
        
    }
    
    
}
