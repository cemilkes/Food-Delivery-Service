//
//  ForgotPasswordController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/20/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import JGProgressHUD

class ForgotPasswordController: UIViewController {

    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var pageDescription: UILabel!
    
    @IBOutlet weak var emailtextField: BTTextfield!
    
    @IBOutlet weak var sendButton: BTButton!
    let hud = JGProgressHUD(style: .dark)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if emailtextField.text != "" {
            resetPassword()
        }else{
            showHUDErrorMessage(text: "Please put your email address", hud: hud, view: self.view)
        }
    }
    
    private func resetPassword(){
        MUser.resetPassword(email: emailtextField.text!) { (error) in
            if error == nil {
                showHUDSuccessMessage(text: "The reset password has sent yo your email address!", hud: self.hud, view: self.view)
                self.dismiss(animated: true, completion: nil)
            }else{
                showHUDErrorMessage(text: error!.localizedDescription, hud: self.hud, view: self.view)
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
