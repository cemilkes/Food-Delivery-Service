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
    @IBOutlet weak var itemDescriptionLabel: UILabel!
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
                    //print(document.data())
                    arr = document.data()
                    self.itemNameLabel.text = arr["name"] as? String
                    self.itemDescriptionLabel.text = arr["description"] as? String
                    self.itemPriceLabel.text = convertToCurrency((arr["price"] as? Double)!)
                }
            }
        }
        print("Quantity", orderItem.quantity)
        print("Special Instruction", orderItem.specialInstruction)
        
    }
    
//    func generateCell(_ item: Item) {
//        itemNameLabel.text  = item.name
//        itemDescriptionLabel.text  = item.description
//        itemPriceLabel.text = "\(item.price!)" // item.price   ////"\(item.price!)"
//        itemPriceLabel.adjustsFontSizeToFitWidth = true
//    }
    
}
