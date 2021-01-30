//
//  AddressController+SearchView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/28/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit

extension AddressController: UISearchBarDelegate{
    
    // This method declares that whenever the text in the searchbar is change to also update
    // the query that the searchCompleter will search based off of
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCompleter.queryFragment = searchText
    }
    
    
    
}
