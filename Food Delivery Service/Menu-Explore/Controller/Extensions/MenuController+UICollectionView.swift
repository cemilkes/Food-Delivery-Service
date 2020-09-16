//
//  MenuController+UICollectionView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/13/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "MenuCell"

// MARK: -

extension MenuController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for:indexPath) as! MenuCell
        
        cell.generateCell(categoryArray[indexPath.row])
        
        return cell
    }

}
