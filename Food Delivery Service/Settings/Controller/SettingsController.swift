//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var profileArray = [ProfileModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func configureTableView(){
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = .none
        
        profileArray = [
            
            ProfileModel(imageName: "iconPromoCode", title: "Promo Code"),
            ProfileModel(imageName: "iconNotification", title: "Notification"),
            ProfileModel(imageName: "iconPaymentMethod", title: "Payment Method"),
            ProfileModel(imageName: "iconRewardCredits", title: "Reward Credits"),
            
            ProfileModel(imageName: "iconSettings", title: "Settings"),
            ProfileModel(imageName: "iconInviteFriends", title: "Invite Friends"),
            ProfileModel(imageName: "iconHelpCenter", title: "Help Center"),
            ProfileModel(imageName: "iconAboutUs", title: "About Us"),
            ProfileModel(imageName: " ", title: "Terms and Conditions")
        ]
    }
    
    private func checkOnBoardStatus(){
        if MUser.currentUser() != nil {
            if MUser.currentUser()!.onBoard {
                print("account is active")
            }else{
                print("Account is inactive")
            }
        }else{
            print("Log out")
        }
    }

   
}
