//
//  WelcomeController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var welcomeTopLabel: BTLabel!
    @IBOutlet weak var loginButton: BTButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func setupUI(){
        
        welcomeTopLabel.text = kWelcomeMessageTitle
        loginButton.titleLabel?.text = kLog_In
    }

//    @IBAction func loginButtonPressed(_ sender: Any) {
//       
//        let storyBoard: UIStoryboard = UIStoryboard(name: Storyboard.authentication, bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: ViewController.loginController) as! LoginController
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
//        
//        
//    }
    
}
