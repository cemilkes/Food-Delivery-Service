//
//  MenuController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import Firebase

class MenuController: UIViewController {
    
    
    // MARK: - Variables
    var categoryArray: [Category] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
                
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCategories()
    }
    
    // MARK: - Load Categories
    func loadCategories(){
        
        downloadCategoriesFromFirebase { (allCategories) in
            
            self.categoryArray = allCategories
            self.collectionView.reloadData()
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Make sure you are connecting to right segue in case of there are more than one segue from the viewcontroller to other one
        if segue.identifier == PerformSegue.menuIdentifier {
            let vc = segue.destination as! ItemsController
            vc.category = sender as? Category
            
        }
        
    }
    
    
    
    
    
}
