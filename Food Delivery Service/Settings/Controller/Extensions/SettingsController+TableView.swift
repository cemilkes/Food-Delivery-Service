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
            //print("Go to Profile Page")
        }else if indexPath.row == 1{
            performSegue(withIdentifier: PerformSegue.showNotifications, sender: self)
            print("Go to Notifications")
        }else if indexPath.row == 2{
            print("Go to Payment Method")
        }else if indexPath.row == 3{
            print("Go to Reward Credit")
        }else if indexPath.row == 4{
            print("Go to Settings")
        }else if indexPath.row == 5{
            shareApplication()
            print("Go to Invite Friends")
        }else if indexPath.row == 6{
            print("Go to Help Center")
        }else if indexPath.row == 7{
            print("About Us")
        }else if indexPath.row == 8{
            print("Terms & Conditions")
        }else{
            print("Nothing")
        }
    }

     func checkUserLoginStatus(){
        //if the user didn't login
        if (MUser.currentUser() == nil && MUser.currentId().count == 0){
            showLoginView()
        
        //if the user login but haven't verified email address
        }else if(MUser.currentUser() == nil && MUser.currentId().count != 0){
            print("Show alert - verify your email address - resend link")
            print(MUser.currentId())
        }else{
        
        //user loginned and verified email address
            print("GotoEditProfile")
            goToEditProfile()
        }
    }
        
    private func showLoginView(){
        let loginView = UIStoryboard.init(name: Storyboard.authentication, bundle: nil).instantiateViewController(identifier: ViewController.loginController)
        self.present(loginView, animated: true, completion: nil)
    }

    private func goToEditProfile(){
        performSegue(withIdentifier: "goEditProfile", sender: self)
    }
 
    private func shareApplication(){
        if let name = URL(string: "https://apps.apple.com/us/app/evercoin-bitcoin-ripple-eth/id1277924158"), !name.absoluteString.isEmpty {
            let textToShare = "This app is awesome!  Make the food delivery faster!"
            let objectsToShare = [name, textToShare] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        } else {
            // show alert for not available
            print("Not opened")
        }
    }
    
}



