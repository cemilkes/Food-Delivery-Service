//
//  AddressController+MapKit.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/29/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension AddressController: MKLocalSearchCompleterDelegate{
    
    // This method declares gets called whenever the searchCompleter has new search results
     // If you wanted to do any filter of the locations that are displayed on the the table view
     // this would be the place to do it.
     func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
         
         // Setting our searcResults variable to the results that the searchCompleter returned
         searchResults = completer.results
         
         // Reload the tableview with our new searchResults
         tableView.reloadData()
     }
     
     // This method is called when there was an error with the searchCompleter
     func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
         // Error
     }
    
}
