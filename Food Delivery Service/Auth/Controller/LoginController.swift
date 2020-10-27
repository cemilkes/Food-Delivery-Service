//
//  LoginController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/26/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: BTTextfield!
    @IBOutlet weak var passwordTextField: BTTextfield!
    
    @IBOutlet weak var loginButtonOutlet: BTButton!
    
    @IBOutlet weak var forgotPasswordOutlet: UIButton!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignUpLabel()
        setupNavigationUI()
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
            NSAttributedString.Key.foregroundColor: Color.lightGrayText.value,
            NSAttributedString.Key.font: Font(.system(.AvenirBook), size: .standart(.h6)).instance
        ]
        
        let signUpAttributedString = NSAttributedString(string: signUpLabelText, attributes: signUpLabelTextAttributes)
        
        let signUpLabelSelectableText = "Sign Up"
        let signUpLabelSelectableTextAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: Color.theme.value,
            NSAttributedString.Key.font: Font(.system(.AvenirBook), size: .standart(.h6)).instance
        ]
        
        let signUpAttributedString2 = NSAttributedString(string: signUpLabelSelectableText, attributes: signUpLabelSelectableTextAttributes)
        
        let concate = NSMutableAttributedString(attributedString: signUpAttributedString)
        concate.append(signUpAttributedString2)
        
        signUpLabel.attributedText = concate
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginController.signInLabelTapped))
        signUpLabel.addGestureRecognizer(tap)
        signUpLabel.isUserInteractionEnabled = true
//        let signUpLabelSelectableText = NSMutableAttributedString(string: "Don\'t have an account? Sign up", attributes: [
//          .font: UIFont(name: "Avenir-Book", size: 17.0)!,
//          .foregroundColor: UIColor(red: 184.0 / 255.0, green: 187.0 / 255.0, blue: 198.0 / 255.0, alpha: 1.0),
//          .kern: -0.41
//        ])
//        attributedString.addAttribute(.foregroundColor, value: UIColor.themeColor, range: NSRange(location: 23, length: 7))
        
    }
    
    @objc func signInLabelTapped(sender:UITapGestureRecognizer) {
           
        
        print("Tapped")
//        let signUpVC = UIStoryboard.init(name: Storyboard.authentication, bundle: nil).instantiateViewController(identifier: ViewController.signUpController) as! SignUpController
//
//        present(signUpVC, animated: true, completion: nil)
    }
    
    
    
}
