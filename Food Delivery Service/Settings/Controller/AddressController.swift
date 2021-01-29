//
//  AddressController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/28/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit

class AddressController: UIViewController {

    let searchController: UISearchController = {

        let searchController = UISearchController(searchResultsController: nil)

        searchController.searchBar.placeholder = "New Search"
        searchController.searchBar.searchBarStyle = .minimal
        //searchController.dismiss = false
        searchController.definesPresentationContext = true

       return searchController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = true
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController!.navigationBar.sizeToFit()
        // Do any additional setup after loading the view.
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
