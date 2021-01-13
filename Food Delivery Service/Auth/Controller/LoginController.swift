//
//  LoginController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/26/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD
import NVActivityIndicatorView

class LoginController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var passwordTextField: BTTextfield!
    
    @IBOutlet weak var loginButtonOutlet: BTButton!
    
    @IBOutlet weak var loginSubView: UIView!
    @IBOutlet weak var forgotPasswordOutlet: UIButton!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    let hud = JGProgressHUD(style: .dark)
    var activityIndicator: NVActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpLabel()
        setupNavigationUI()
        setupUI()
        setupLoginSubView()
    
        let signUpLabelGesture = UITapGestureRecognizer(target: self, action: #selector(signUpLabelClicked(_ :)))
        signUpLabel.addGestureRecognizer(signUpLabelGesture)
    
        // Register Notification Center for Keyboard controller (Listen for keyboard's events)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupNavigationUI(){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
   
    
    func setupUI(){
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    func setupActivityIndicator(){
        let width = self.view.frame.width
        let heigth = self.view.frame.height
        
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: width/2 - 30, y: heigth/2 - 30, width: 60.0, height: 60.0), type: .ballPulse, color: .brown, padding: nil)
        
    }
    
    
    @objc func signUpLabelClicked(_ sender: UITapGestureRecognizer){
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.authentication, bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.signUpController) as! SignUpController
                //vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
    }
    
    func setupLoginSubView(){
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.loginSubView.frame
        rectShape.position = self.loginSubView.center
        rectShape.path = UIBezierPath(roundedRect: self.loginSubView.bounds, byRoundingCorners: [.topRight , .topLeft], cornerRadii: CGSize(width: 16, height: 16)).cgPath

        //Here I'm masking the textView's layer with rectShape layer
        self.loginSubView.layer.mask = rectShape
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
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if textFieldHaveText() {
            loginUser()
            
        }else{
            showHUDErrorMessage(text: "All fields are required", hud: hud, view: self.view)
        }
    }
    
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.authentication, bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.forgotPasswordController) as! ForgotPasswordController
                self.present(vc, animated: true, completion: nil)
    }
    
    private func loginUser(){
        showLoadingIndicator()
        
        MUser.loginWithUser(email: emailTextField.text!, password: passwordTextField.text!) { (error, isEmailVerified) in
            if error == nil{
                
                if isEmailVerified {
                    self.openMenuController()
                    print("Email is verified")
                }else{
                    showHUDErrorMessage(text: "Please verify your email address", hud: self.hud, view: self.view)
                }
                
            }else{
                showHUDErrorMessage(text: error!.localizedDescription, hud: self.hud, view: self.view)
            }
            
            self.hideLoadingIndicator()
        }
    }

    
    private func openMenuController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.main, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.tabbarController) as! TabbarController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    func setupSignUpLabel(){
        let signUpLabelText =  "Don't have an account? "
       
        let signUpLabelTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: Color.mediumGreyText.value,
            NSAttributedString.Key.font: UIFont(name: "Avenir-Book", size: 17.0)!
        ]
        
        let signUpAttributedString = NSAttributedString(string: signUpLabelText, attributes: signUpLabelTextAttributes)
        
        let signUpLabelSelectableText = Strings.signUpText
        let signUpLabelSelectableTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: Color.theme.value,
            NSAttributedString.Key.font: UIFont(name: "Avenir-Book", size: 17.0)!
        ]
        
        let signUpAttributedString2 = NSAttributedString(string: signUpLabelSelectableText, attributes: signUpLabelSelectableTextAttributes)
        
        let concate = NSMutableAttributedString(attributedString: signUpAttributedString)
        concate.append(signUpAttributedString2)
        
        signUpLabel.attributedText = concate
        
//        let signUpLabelSelectableText = NSMutableAttributedString(string: "Don\'t have an account? Sign up", attributes: [
//          .font: UIFont(name: "Avenir-Book", size: 17.0)!,
//          .foregroundColor: UIColor(red: 184.0 / 255.0, green: 187.0 / 255.0, blue: 198.0 / 255.0, alpha: 1.0),
//          .kern: -0.41
//        ])
//        attributedString.addAttribute(.foregroundColor, value: UIColor.themeColor, range: NSRange(location: 23, length: 7))
        
    }
    
    
    @IBAction func exploreAsAGuessBarButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.main, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.tabbarController) as! TabbarController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
    }
    
    
    //MARK: - Dismiss View
    
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
