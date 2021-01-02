//
//  ItemCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/25/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func generateCell(_ item: Item) {
       
        itemNameLabel.text  = item.name
        itemDescLabel.text  = item.description
        itemPriceLabel.text = convertToCurrency(item.price)   // "$\(item.price!)"
        itemPriceLabel.adjustsFontSizeToFitWidth = true
        
//        if item.imageLinks != nil && item.imageLinks.count > 0 {
//            
//            downloadImages(imageUrls: [item.imageLinks.first!]) { (images) in
//                self.itemImageView.image = images.first as? UIImage
//            }
//        }
        
    }
    
    
    
}
