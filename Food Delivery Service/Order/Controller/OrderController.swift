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
    var basket: Basket?
    var allItems: [Item] = []
    var purchasedItemIds : [String] = []
    
    let hud = JGProgressHUD(style: .dark)
    
    @IBOutlet weak var subTotalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
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
            downloadItems(basket!.itemIds){ (allItems) in
                self.allItems = allItems
                self.updateTotalLabels(false)
                self.tableView.reloadData()
            }
        }
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
            //totalPrice += Double(item.price)!
        }
        
        return convertToCurrency(totalPrice)
        
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
