//
//  ItemDetail+UITableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/17/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "ItemDetailCell"

extension ItemDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ItemDetailCell
        cell.configure(item)
        
        cell.onIncreaseButtonPressed = { [weak self] sender in
            // Do your magic stuff here
            self!.quantity = self!.quantity + 1
            cell.itemQuantityLabel.text = "\(self!.quantity)"
            self!.addToOrderLabel.text = "Add to Order - $\(Double(self!.item.price * Double(self!.quantity)).rounded(toPlaces: 2))"
            //self!.orderItem.quantity = self!.quantity
        }
        
        cell.onDescreaseButtonPressed  = { [weak self] sender in
            
            if self!.quantity == 1 {
                print("Quantity is equal to 1")
                self!.addToOrderLabel.text = "Add to Order - $\(Double(self!.item.price * Double(self!.quantity)).rounded(toPlaces: 2))"
                
            }else{
                self!.quantity = self!.quantity - 1
                cell.itemQuantityLabel.text = "\(self!.quantity)"
                self!.addToOrderLabel.text = "Add to Order - $\(Double(self!.item.price * Double(self!.quantity)).rounded(toPlaces: 2))"
                
            }
        }
        return cell
    }
}

extension ItemDetailController: UITableViewDelegate {
    
   
    
}

