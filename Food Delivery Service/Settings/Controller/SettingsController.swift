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
            ProfileModel(imageName: " ", title: "Terms and Conditions"),
            ProfileModel(imageName: " ", title: "Log Out")
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

    private func updateDoneButtonStatus(){
        
    }
    
    private func logOut(){
        MUser.logOutCurrentUser { (error) in
            if error == nil{
                print("Log out")
                //self.navigationController?.popViewController(animated: true)
            }else{
                print("Error occured \(error?.localizedDescription)")
            }
        }
    }




//    private func finishOnboarding(){
//        let values = [kUSERNAME: nameTextField.text!, kEMAIL: emailTextField.text!, kONBOARD: true, kADDRESS: addressTextField.text!, kPHONENUMBER: phoneNumberTextField.text!] as [String:Any]
//        updateUserInfoInFirebase(withValues: values) { (error) in
//            if error == nil {
//                //hud success
//                self.dismiss(animated: true, completion: nil)
//            }else{
//                print("error updating user \(error.localizedDescription)")
//                //hud error
//            }
//
//        }
//    }
   
}
