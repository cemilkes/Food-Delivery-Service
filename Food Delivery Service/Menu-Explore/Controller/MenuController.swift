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

class MenuController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    // MARK: - Variables
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadCategoriesFromFirebase { (allCategories) in
            
            print("Called")
            
        }
        //createCategorySet()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: re, for: <#T##IndexPath#>)
        return UICollectionViewCell()
    }

}
