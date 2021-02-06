//
//  OrderController+TableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/9/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "OrderCell"

extension OrderController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("allItem counts: ",allItems.count)
        if allItems.count == 0 {
            tableView.setEmptyView(title: "Cart Empty.", message: "Good food is always cooking! Go ahead, order some yummy items from the menu.")
            basketTotalSummaryView.isHidden = true
        }else{
            tableView.restore()
            basketTotalSummaryView.isHidden = false
        }
        
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OrderCell
        cell.generateCell(allItems[indexPath.row])
        
        return cell
    }
}

extension OrderController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let orderItemToDelete = allItems[indexPath.row]
            allItems.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            removeItemFromBasket(orderItemId: orderItemToDelete.id)
            
            updateBasketInFirestore(basket!, withValues: [kORDERITEMIDs: basket!.orderItemIds!]) { (error) in
                if error != nil {
                    print("error updating the basket", error?.localizedDescription as Any)
                }
                self.getBasketItems()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //showItemView(withItem: allItems[indexPath.row])
        
        
    }
    
}
