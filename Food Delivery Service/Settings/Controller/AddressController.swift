//
//  AddressController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/28/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import MapKit

protocol AddressControllerDelegate: class {
    
    func addressChanged(address:String?)
    
}


class AddressController: UIViewController {

    weak var addressDelegate: AddressControllerDelegate?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Create a seach completer object
    var searchCompleter = MKLocalSearchCompleter()
    
    // These are the results that are returned from the searchCompleter & what we are displaying
    // on the searchResultsTable
    var searchResults = [MKLocalSearchCompletion]()
    var userAddress: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI(){
        tableView.delegate = self
        tableView.dataSource = self
        searchCompleter.delegate = self
        searchBar?.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
