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
    var item: Item?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell(orderItem: OrderItem){
        
        var arr = [String:Any]()
        FirebaseReference(.Items).whereField(kOBJECTID, isEqualTo: orderItem.itemId!).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    arr = document.data()
                    self.orderDateAndTotalAmountLabel.text = arr["name"] as! String
                    self.orderItemsDetailLabel.text = arr["description"] as! String
                   print(arr)
                }
            }
        }
        
        
        
        
        
        
    }
    private func loadItemFrom(orderItems: OrderItem){
        
        FirebaseReference(.Items).document(orderItems.itemId).getDocument { (snapshot, error) in
            guard let snapshot = snapshot else {
                return
            }
            if snapshot.exists {
                
                print(self.item?.name)
                print(self.item?.price)
            }else {
                
            }
        }
        
    }

}
