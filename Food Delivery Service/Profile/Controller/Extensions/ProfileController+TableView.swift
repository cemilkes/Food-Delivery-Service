//
//  ProfileController+TableView.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit


private let reuseIdentifier = "ProfileCell"


extension ProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProfileCell
        cell.generateCell(profileArray[indexPath.row])
        
        return cell
        
    }
    
}

extension ProfileController: UITableViewDelegate {
    
    
}
