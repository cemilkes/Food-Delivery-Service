//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var profileArray = [ProfileModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        profileArray = [
            ProfileModel(imageName: "iconNotification", title: "Notification"),
            ProfileModel(imageName: "iconPaymentMethod", title: "Payment Method"),
            ProfileModel(imageName: "iconRewardCredits", title: "Reward Credits"),
            ProfileModel(imageName: "iconPromoCode", title: "Promo Code"),
            ProfileModel(imageName: "iconSettings", title: "Settings"),
            ProfileModel(imageName: "iconInviteFriends", title: "Invite Friends"),
            ProfileModel(imageName: "iconHelpCenter", title: "Help Center"),
            ProfileModel(imageName: "iconAboutUs", title: "About Us")
        ]
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
