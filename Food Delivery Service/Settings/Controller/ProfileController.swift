//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/7/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD

class ProfileController: UIViewController {

    @IBOutlet weak var userNameTextField: BTTextfield!
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var phoneNumberTextField: BTTextfield!
    @IBOutlet weak var addressTextField: BTTextfield!
    @IBOutlet weak var birthOfDateTextField: BTTextfield!
    
    @IBOutlet weak var updateBarButtonItemOutlet: UIBarButtonItem!
    var editBarButtonOutlet: UIBarButtonItem!
    var hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
        setupTextFieldDidChange()
        // Do any additional setup after loading the view.
    }

    private func setupTextFieldDidChange(){
        userNameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        addressTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        birthOfDateTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: Any){
        print("Editing")
    }
    
    privat func configUpdateBarButtonStatus(){
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
