//
//  ProfileHeaderCell.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/28/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var memberStatusImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func generateCell(){
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 46.5
        userNameLabel.text = "Joseph"
                        	
    }
    
}
