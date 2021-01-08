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
    
    var editBarButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkUserLoginStatus()
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
            ProfileModel(imageName: "iconAboutUs", title: "About Us")
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
    
    private func checkUserLoginStatus(){
        if MUser.currentUser() == nil {
            createRightBarButton(title: "Login")
        }else{
            createRightBarButton(title: "Edit")
        }
    }
    
    private func createRightBarButton(title: String){
        editBarButtonOutlet = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightBarButtonItemPressed))
        self.navigationItem.rightBarButtonItem = editBarButtonOutlet
    }
    
    @objc func rightBarButtonItemPressed(){
        if editBarButtonOutlet.title ==  "Login"{
            //show login view
            showLoginView()
        }else{
            //go to profile
            goToEditProfile()
        }
    }
    
    private func showLoginView(){
        let loginView = UIStoryboard.init(name: Storyboard.authentication, bundle: nil).instantiateViewController(identifier: ViewController.loginController)
        self.present(loginView, animated: true, completion: nil)
    
    }
    
    private func goToEditProfile(){
        print("Edit Profile")
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
