//
//  ItemDetailCollectionReusableView.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let shared = HeaderCollectionReusableView()
    static let identifier = "HeaderCollectionReusableView"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemQuantityStackView: UIStackView!
    @IBOutlet weak var decreaseItemQuantityLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var increaseItemQuantityLabel: UILabel!
    
    var quantity: Int = 0
    
    func initializeHeaderCollectionResuableView(){
        let increaseItemQuantityLabelGesture = UITapGestureRecognizer(target: self, action: Selector(("increaseItemQuantityLabelPressed")))
        increaseItemQuantityLabel.addGestureRecognizer(increaseItemQuantityLabelGesture)
    }
    
    func increaseItemQuantityLabelPressed(_ item: Item){
        quantity = quantity + 1
        item.price = item.price * Double(quantity)
        print(quantity)
        print(item.price)
    }
    
    
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

    @IBOutlet weak var specialRequestTextView: UITextView!
    
    static let identifier = "FooterCollectionReusableView"
    
    public func configure(item: Item){
        
    }
    
    
}
