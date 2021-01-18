//
//  OrderHistory+TableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/30/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "OrderHistoryCell"

extension OrderHistoryController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if orderedItems.count == 0 {
            tableView.setEmptyView(title: "You don't have any purchased item yet.", message: "Your order-history will be in here.")
        }else{
            tableView.restore()
            
        }
        return orderedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! OrderHistoryCell
        
        cell.generateCell(orderItem: orderedItems[indexPath.row])
        return cell
    }

}

extension OrderHistoryController: UITableViewDelegate{
    
    
    
    
}
