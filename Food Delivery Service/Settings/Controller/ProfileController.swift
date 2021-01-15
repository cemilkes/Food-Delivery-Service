//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/7/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var userNameTextField: BTTextfield!
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var phoneNumberTextField: BTTextfield!
    @IBOutlet weak var addressTextField: BTTextfield!
    @IBOutlet weak var birthOfDateTextField: BTTextfield!
    
    var editBarButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        // Do any additional setup after loading the view.
    }
    
    private func loadUserInfo(){
        if MUser.currentUser() != nil {
            let currentUser = MUser.currentUser()!
            userNameTextField.text = currentUser.username
            emailTextField.text = currentUser.email
            phoneNumberTextField.text = currentUser.phoneNumber
            addressTextField.text = currentUser.address
            birthOfDateTextField.text = currentUser.birthDate
            
        }
    }
    
    @IBAction func updateBarButtonPressed(_ sender: Any) {
        
        dismissKeyboard()
        
        if textFieldHaveText() {
            
            let withValues = [
                kUSERNAME: userNameTextField.text!,
                kEMAIL:    emailTextField.text!
            ]
            
            updateUserInfoInFirebase(withValues: withValues) { (error) in
                if error == nil {
                    print("OK")
                    // hud - Updated
                }else {
                    //hud - error
                }
            }
            
        }else{
            //hud - all fields are required
        }
    }
     
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func textFieldHaveText() -> Bool{
        return(userNameTextField.text != "" && emailTextField.text != "")
    }
    
    private func createRightBarButton(title: String){
        editBarButtonOutlet = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightBarButtonItemPressed))
        self.navigationItem.rightBarButtonItem = editBarButtonOutlet
    }
    
    @objc func rightBarButtonItemPressed(){
        if editBarButtonOutlet.title ==  "Login"{
            //show login view
            
        }else{
            //go to profile
            
        }
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
