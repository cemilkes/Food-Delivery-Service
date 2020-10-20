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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.loginController) as! LoginController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    
    
}
