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

    @IBOutlet weak var emailTextField: BTTextfield!
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
        emailTextField.delegate = self
        
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
        view.frame.origin.y = -30
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        //print("Keyboard will show \(notification.name.rawValue)")

        view.frame.origin.y = 0
    }
    
    
    func hideKeyboard(){
        passwordTextField.resignFirstResponder()
        rePasswordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    @IBAction func signUpButtonPressed(_ sender: BTButton) {
    
        
        
        if !textFieldHaveText() {
            showHUDErrorMessage(text: "All fields are required", hud: hud, view: view)
        }
        if  !checkPasswordsIdentical(){
            showHUDErrorMessage(text: "Passwords didn't match", hud: hud, view: view)
        }
        if textFieldHaveText() && checkPasswordsIdentical() {
            registerUser()
            
        }
    }
    
    //performSegue(withIdentifier: "main", sender: self)
    private func registerUser(){
        showLoadingIndicator()
        MUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error) in
            
            if error == nil{
                //since the func runs in background, it requires to put self
                showHUDSuccessMessage(text: "Verification Email Has Sent", hud: self.hud, view: self.view)
                self.openLoginPage()
            }else{
                showHUDErrorMessage(text: error!.localizedDescription, hud: self.hud, view: self.view)
            }
            self.hideLoadingIndicator()
        }
    }
    
    private func resendEmailVerification(){
        
        MUser.resendVerificationEmail(email: emailTextField.text!){ (error) in
            print("error \(error?.localizedDescription)") as! Error
        }
    }

    func openLoginPage(){
        let loginVew = UIStoryboard.init(name: Storyboard.authentication, bundle: .main).instantiateViewController(identifier: ViewController.loginController)
        loginVew.modalPresentationStyle = .fullScreen
        self.present(loginVew, animated: true, completion: nil)
    }
    
    
    
    func openMenuPage(){
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.main, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.tabbarController) as! TabbarController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
    }
    
    private func checkPasswordsIdentical() -> Bool{
        if passwordTextField.text != rePasswordTextField.text {
            return false
        }
        return true
        //return (passwordTextField.text == rePasswordTextField.text)
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
