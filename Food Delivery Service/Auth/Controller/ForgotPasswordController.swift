//
//  ForgotPasswordController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/20/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {

    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var pageDescription: UILabel!
    
    @IBOutlet weak var emailtextField: BTTextfield!
    
    @IBOutlet weak var sendButton: BTButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
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
