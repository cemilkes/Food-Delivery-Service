//
//  FavouriteController+TableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/30/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "FavouriteCell"

extension FavouriteController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        cell?.textLabel?.text = "Favourite"
        
        return cell!
    }

}

extension FavouriteController: UITableViewDelegate{
    
    
    
    
}
