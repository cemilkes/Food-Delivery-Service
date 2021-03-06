//
//  OrderCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/9/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    
    @IBOutlet weak var itemNameLabel: UILabel!
    //@IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    var item:Item!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func generateCell(_ orderItem: OrderItem){
        
        var arr = [String:Any]()
        FirebaseReference(.Items).whereField(kOBJECTID, isEqualTo: orderItem.itemId!).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    arr = document.data()
                    self.itemNameLabel.text = "\(orderItem.quantity!) x \((arr["name"] as? String)!)"
                    //self.itemDescriptionLabel.text = orderItem.specialInstruction
                        //arr["description"] as? String
                    
                    self.itemPriceLabel.text = convertToCurrency(orderItem.totalAmount)
                        //convertToCurrency((arr["price"] as? Double)!)
                }
            }
        }
        //print("Quantity", orderItem.quantity)
        //print("Special Instruction", orderItem.specialInstruction)
        
    }
    
}
