//
//  MenuController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "MenuCell"

class MenuController: UIViewController {
    
    
    // MARK: - Variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadCategoriesFromFirebase { (allCategories) in
            
            
            print("Called")
            
        }
        //createCategorySet()
        // Do any additional setup after loading the view.
    }

}
