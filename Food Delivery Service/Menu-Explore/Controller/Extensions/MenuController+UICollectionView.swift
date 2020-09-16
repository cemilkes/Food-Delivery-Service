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

private let sectionInsets   = UIEdgeInsets(top: 14.0, left: 15.0, bottom: 18.0, right: 15)

private let itemsPerRow     = 2

extension MenuController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // MARK: - Collection View Data Source & Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for:indexPath) as! MenuCell
        
        cell.generateCell(categoryArray[indexPath.row])
        
        return cell
    }

}

// MARK: - CollectionView Delegate Flow Layout

extension MenuController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let paddingSpace = sectionInsets.left * CGFloat(itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let withPerItem = availableWidth / CGFloat(itemsPerRow)
        return CGSize(width: withPerItem, height: 191.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    
}
