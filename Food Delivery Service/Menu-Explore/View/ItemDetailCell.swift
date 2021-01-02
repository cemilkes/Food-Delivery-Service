//
//  ItemDetailCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/1/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    var onIncreaseButtonPressed: ((_ sender: UIButton) -> ())?
    var onDescreaseButtonPressed: ((_ sender: UIButton) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func increaseItemQuantityButtonPressed(_ sender: UIButton) {
        onIncreaseButtonPressed?(sender)
    }
    
    @IBAction func decreaseItemQuantityButtonPressed(_ sender: UIButton) {
        onDescreaseButtonPressed?(sender)
    }

    func configure(_ item: Item){
        
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = convertToCurrency(item.price)
    }
    
}
