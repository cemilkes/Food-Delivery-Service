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
        if favouritesArray.count == 0 {
            tableView.setEmptyView(title: "You don't have any favourite item yet.", message: "You can add item to Favourites by adding favourite icon!")
        }else{
            tableView.restore()
        }
        return favouritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        cell?.textLabel?.text = "Favourite"
        
        return cell!
    }

}

extension FavouriteController: UITableViewDelegate{
    
    
    
    
}
