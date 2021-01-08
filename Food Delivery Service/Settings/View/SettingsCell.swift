//
//  ProfileCell.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func generateCell(_ profileModel: ProfileModel){
        
        titleImage.image = UIImage(named: profileModel.imageName)
        titleLabel.text = profileModel.title

    }

}
