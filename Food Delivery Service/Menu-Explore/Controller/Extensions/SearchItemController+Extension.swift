//
//  SearchItemController+Extension.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/21/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit

extension SearchItemController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.generateCell(searchResults[indexPath.row])
    
        return cell
    }
    
}

extension SearchItemController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        showItemView(withItem: searchResults[indexPath.row])
        
        
    }
}
