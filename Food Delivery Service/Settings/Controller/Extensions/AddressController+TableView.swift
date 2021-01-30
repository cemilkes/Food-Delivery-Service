//
//  AddressController+TableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/28/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import MapKit
import UIKit

extension AddressController: UITableViewDataSource{
    
    // This method declares the number of sections that we want in our table.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // This method declares how many rows are the in the table
    // We want this to be the number of current search results that the
    // Completer has generated for us
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count;
    }
    
    // This method delcares the cells that are table is going to show at a particular index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the specific searchResult at the particular index
        let searchResult = searchResults[indexPath.row]
        
        //Create  a new UITableViewCell object
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        //Set the content of the cell to our searchResult data
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }

}

extension AddressController: UITableViewDelegate{
    // This method declares the behavior of what is to happen when the row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }
            
            guard let name = response?.mapItems[0].name else {
                return // 945 Baines Street
            }
            guard let city = response?.mapItems[0].placemark.postalAddress?.city else {
                return // East Palo Alto
            }
            guard let state = response?.mapItems[0].placemark.postalAddress?.state else {
                return // CA
            }
            guard let postalCode = response?.mapItems[0].placemark.postalCode else {
                return // 94303
            }
            guard let countryCode = response?.mapItems[0].placemark.countryCode else {
                return // US
            }
            
            self.userAddress = "\(name) \(city), \(state) \(postalCode), \(countryCode)"
            //print(userAddress)
            self.addressDelegate?.addressChanged(address: self.userAddress)
            self.dismiss(animated: true, completion: nil)
            let lat = coordinate.latitude
            let lon = coordinate.longitude
            
            print(lat)
            print(lon)
            
        }
    }
    
}
