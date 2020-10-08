//
//  ItemController+TableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "ItemCell"

extension ItemsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        cell.generateCell(itemArray[indexPath.row])
        
        return cell
    }
}

extension ItemsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(itemArray[indexPath.row])
    }
    
}
