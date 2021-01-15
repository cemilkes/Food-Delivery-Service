//
//  ProfileController+TableView.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit


private let reuseIdentifier = "SettingsCell"
private let headerReuseIdentifier = "SettingsHeaderCell"

extension SettingsController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerReuseIdentifier, for: indexPath) as! SettingsHeaderCell
               cell.generateCell()
               return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
               cell.generateCell(profileArray[indexPath.row])
               return cell
        }
        
         
    }
    
}

extension SettingsController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            checkUserLoginStatus()
            print("Go to Profile Page")
        }else if indexPath.row == 1{
            print("Go to Notfications")
        }else if indexPath.row == 2{
            print("Go to Payment Method")
        }else if indexPath.row == 3{
            print("Go to Reward Credit")
        }else if indexPath.row == 4{
            print("Go to Settings")
        }else if indexPath.row == 5{
            print("Go to Invite Friends")
        }else if indexPath.row == 6{
            print("Go to Help Center")
        }else if indexPath.row == 7{
            print("About Us")
        }else if indexPath.row == 8{
            print("Terms & Conditions")
        }else if indexPath.row == 8{
            print("Log Out")
        }
        else{
            print("Nothing")
        }
    }

     func checkUserLoginStatus(){
        if MUser.currentUser() == nil {
            showLoginView()
            print("No user found")
        }else{
            goToEditProfile()
            print(MUser.currentId())
        }
    }
        
    private func showLoginView(){
        let loginView = UIStoryboard.init(name: Storyboard.authentication, bundle: nil).instantiateViewController(identifier: ViewController.loginController)
        self.present(loginView, animated: true, completion: nil)

    }

    private func goToEditProfile(){
        let profileView = UIStoryboard.init(name: Storyboard.settings, bundle: nil).instantiateViewController(identifier: ViewController.profileController)
        self.present(profileView, animated: true, completion: nil)
    }
    
    
}


