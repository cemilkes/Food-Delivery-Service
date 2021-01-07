//
//  SignUpController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/7/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD
import NVActivityIndicatorView

class SignUpController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: BTTextfield!
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var dateOfBirthTextfield: BTTextfield!
    @IBOutlet weak var passwordTextField: BTTextfield!
    @IBOutlet weak var rePasswordTextField: BTTextfield!
    @IBOutlet weak var termsLabel: UILabel!
    
    let hud = JGProgressHUD(style: .dark)
    var activityIndicator: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    private func setupUI(){
        let width = self.view.frame.width
        let heigth = self.view.frame.height
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: width/2 - 30, y: heigth/2 - 30, width: 60.0, height: 60.0), type: .ballPulse, color: .brown, padding: nil)
        // Do any additional setup after loading the view.
        // Register Notification Center for Keyboard controller (Listen for keyboard's events)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        
    }

    deinit {
        // Stop listening for keyboard hide/show event
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        //print("Keyboard will show \(notification.name.rawValue)")
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        view.frame.origin.y = -keyboardRect.height
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        //print("Keyboard will show \(notification.name.rawValue)")

        view.frame.origin.y = 0
    }
    
    
    func hideKeyboard(){
        passwordTextField.resignFirstResponder()
        rePasswordTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    @IBAction func signUpButtonPressed(_ sender: BTButton) {
        
        print("Pressed")
        if textFieldHaveText() && checkPasswordsIdentical() {
            registerUser()
        }else{
            hud.textLabel.text = "All fields are required"
            hud.indicatorView = JGProgressHUDErrorIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
        }
    }
    
    
    //performSegue(withIdentifier: "main", sender: self)
    private func registerUser(){
        showLoadingIndicator()
        MUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error) in
            
            if error == nil{
                //since the func runs in background, it requires to put self
                self.hud.textLabel.text = "Verification Email Has Sent"
                self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 3.0)
            }else{
                self.hud.textLabel.text = "\(error?.localizedDescription)"
                self.hud.indicatorView = JGProgressHUDErrorIndicatorView()
                self.hud.show(in: self.view)
                self.hud.dismiss(afterDelay: 3.0)
            }
            self.hideLoadingIndicator()
        }
    }
    
    private func resendEmailVerification(){
        
        MUser.resendVerificationEmail(email: emailTextField.text!){ (error) in
            print("error \(error?.localizedDescription)") as! Error
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "goToAlternateStoryboard" {
//                guard let vc = segue.destination as? AlternateViewController else { return }
//                vc.segueText = segueTextField.text
//            }
        }
    
    private func checkPasswordsIdentical() -> Bool{
        return (passwordTextField.text != rePasswordTextField.text)
    }
    
    private func textFieldHaveText() -> Bool{
        return (emailTextField.text != "" && passwordTextField.text != "")
    }
    
    private func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Activity Indicator
    private func showLoadingIndicator(){
        
        if activityIndicator != nil{
            self.view.addSubview(activityIndicator!)
            activityIndicator?.startAnimating()
        }
    }
    
    private func hideLoadingIndicator(){
        
        if activityIndicator != nil{
            activityIndicator!.removeFromSuperview()
            activityIndicator!.stopAnimating()
        }
    }
    
    
    
    
}
