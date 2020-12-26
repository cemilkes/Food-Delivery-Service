//
//  ItemDetailCollectionReusableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"
    
    @IBOutlet weak var itemImageView: UIImageView!
  
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    func configure(_ item: Item){
        itemName.text = item.name
        itemDescription.text = item.description
        itemPrice.text = convertToCurrency(item.price)
        if item.imageLinks != nil && item.imageLinks.count > 0 {
                    
                    downloadImages(imageUrls: [item.imageLinks.first!]) { (images) in
                        self.itemImageView.image = images.first as? UIImage
                    }
        }else{
            itemImageView.frame.size.height = 1;
        }
    }
    
}


class FooterCollectionReusableView: UICollectionReusableView {

    
    
    static let identifier = "FooterCollectionReusableView"
    
}
