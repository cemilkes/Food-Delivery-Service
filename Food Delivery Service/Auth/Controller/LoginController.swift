//
//  LoginController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/26/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var passwordTextField: BTTextfield!
    
    @IBOutlet weak var loginButtonOutlet: BTButton!
    
    @IBOutlet weak var loginSubView: UIView!
    @IBOutlet weak var forgotPasswordOutlet: UIButton!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpLabel()
        setupNavigationUI()
        setupUI()
        setupLoginSubView()
    
        
        let signUpLabelGesture = UITapGestureRecognizer(target: self, action: #selector(signUpLabelClicked(_:)))
        signUpLabel.addGestureRecognizer(signUpLabelGesture)
    
        // Register Notification Center for Keyboard controller (Listen for keyboard's events)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func signUpLabelClicked(){
        print("Clicked")
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
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.authentication, bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.signUpController) as! SignUpController
                //vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.authentication, bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.forgotPasswordController) as! ForgotPasswordController
                //vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
        
    }
    
    func setupSignUpLabel(){
        let signUpLabelText =  "Don't have an account? "
       
        let signUpLabelTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: Color.mediumGreyText.value,
            NSAttributedString.Key.font: UIFont(name: "Avenir-Book", size: 17.0)!
        ]
        
        let signUpAttributedString = NSAttributedString(string: signUpLabelText, attributes: signUpLabelTextAttributes)
        
        let signUpLabelSelectableText = "Sign Up"
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
    
    
    
}
