//
//  MenuCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func generateCell(_ category: Category){
        
        nameLabel.text   = category.name
        imageView.image = category.image
        
    }
    
    
    
}
