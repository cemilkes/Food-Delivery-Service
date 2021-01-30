//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/7/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD

class ProfileController: UIViewController, AddressControllerDelegate {
    
    @IBOutlet weak var userNameTextField: BTTextfield!
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var phoneNumberTextField: BTTextfield!
    @IBOutlet weak var addressTextField: BTTextfield!
    @IBOutlet weak var birthOfDateTextField: BTTextfield!
    
    @IBOutlet weak var logOutButtonOutlet: UIButton!
    @IBOutlet weak var updateBarButtonItemOutlet: UIBarButtonItem!
    var editBarButtonOutlet: UIBarButtonItem!
    var hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
     
        updateBarButtonItemOutlet.tintColor = #colorLiteral(red: 0.7707532048, green: 0.7820937037, blue: 0.8177983165, alpha: 1)
        updateBarButtonItemOutlet.isEnabled = false
        setupTextFieldDidChange()
        
        addressTextField.addTarget(self, action: #selector(addressTextFieldPressed), for: .touchDown)
        
    }
        

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // loadUserInfo()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let addressController = segue.destination as? AddressController {
                addressController.userAddress = addressTextField.text
                addressController.delegate = self
            }
        }
    
    func addressChanged(address: String?) {
        addressTextField.text = address
    }
    
    @objc func addressTextFieldPressed() {
        let itemVC = UIStoryboard.init(name: Storyboard.settings, bundle: nil).instantiateViewController(identifier: ViewController.addressController) as! AddressController
        //itemVC.item = item
        itemVC.modalPresentationStyle = .fullScreen
        present(itemVC, animated: true, completion: nil)
    }
    
    private func setupTextFieldDidChange(){
        emailTextField.isUserInteractionEnabled = false
        userNameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        addressTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        birthOfDateTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender: Any){
        print("Editing")
        configUpdateBarButtonStatus()
    }
    
    private func configUpdateBarButtonStatus(){
        
        if userNameTextField.text != "" && phoneNumberTextField.text != ""  && addressTextField.text != "" && birthOfDateTextField.text != ""{
            updateBarButtonItemOutlet.tintColor = #colorLiteral(red: 0.7707532048, green: 0.7820937037, blue: 0.8177983165, alpha: 1)
            updateBarButtonItemOutlet.isEnabled = false
        }else{
            updateBarButtonItemOutlet.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            updateBarButtonItemOutlet.isEnabled = true
        }
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
                kEMAIL:    emailTextField.text!,
                kADDRESS: addressTextField.text!,
                kPHONENUMBER: phoneNumberTextField.text!,
                kBIRTHDATE: birthOfDateTextField.text!
            ]
            
            updateUserInfoInFirebase(withValues: withValues) { (error) in
                if (error == nil) {
                    showHUDSuccessMessage(text: "Informations are updated!", hud: self.hud, view: self.view)
                    self.dismiss(animated: true, completion: nil)
                }else {
                    showHUDErrorMessage(text: error.localizedDescription, hud: self.hud, view: self.view)
                }
            }
        }else{
            showHUDErrorMessage(text: "All fields are required", hud: self.hud, view: self.view)
        }
    }
     
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func textFieldHaveText() -> Bool{
        return(userNameTextField.text != "" && emailTextField.text != "")
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        logOut()
    }
    
    private func logOut(){
        MUser.logOutCurrentUser { (error) in
            if error == nil{
                print("Log out")
                self.navigationController?.popViewController(animated: true)
                //openLoginView
            }else{
                print("Error occured \(String(describing: error?.localizedDescription))")
            }
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
