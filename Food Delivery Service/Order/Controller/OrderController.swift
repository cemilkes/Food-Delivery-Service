//
//  OrderController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/9/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD

class OrderController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var taxAndFeesTotalLabel: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    
    let hud = JGProgressHUD(style: .dark)
    var basket: Basket?
    var allItems: [OrderItem] = []
    var purchasedItemIds : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadBasketFromFirestore()
        setupUI()
    }
    
    
    
    private func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self

        continueView.layer.cornerRadius = 8
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadBasketFromFirestore()
        
        // Check if the user is logged in
        
    }
    
    //MARK: - Download Basket
    
    func loadBasketFromFirestore(){
        downloadBasketFromFirestore("1234"){ (basket) in
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
        }
    }
    
    private func returnBasketTotalPrice() -> String {
        
        var totalPrice = 0.0
        
        for item in allItems {
            //totalPrice = totalPrice + convertCurrencyToDouble(input: item.price!)
        }
        
        //print(totalPrice)
        
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
    
    func removeItemFromBasket(itemId: String){
        
        for i in 0..<basket!.orderItemIds.count {
            if itemId == basket!.orderItemIds[i] {
                basket?.orderItemIds.remove(at: i)
                return 
            }
        }
    }

    
    func showItemView(withItem: Item) {
        let itemVC = UIStoryboard.init(name: Storyboard.menu, bundle: nil).instantiateViewController(identifier: ViewController.itemDetailController) as! ItemDetailController
        itemVC.item = withItem
        present(itemVC, animated: true, completion: nil)
        itemVC.modalPresentationStyle = .formSheet
        
    }
    
    
}
