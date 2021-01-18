//
//  OrderHistoryCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/6/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit

class OrderHistoryCell: UITableViewCell {

    @IBOutlet weak var orderDateAndTotalAmountLabel: UILabel!
    @IBOutlet weak var orderItemsDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell(orderItem: OrderItem){
        
        orderDateAndTotalAmountLabel.text = orderItem.id
        orderItemsDetailLabel.text = orderItem.ownerId
        
        
    }
    

}
