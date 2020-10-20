//
//  SignUpController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 9/7/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goToMain(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "goToAlternateStoryboard" {
//                guard let vc = segue.destination as? AlternateViewController else { return }
//                vc.segueText = segueTextField.text
//            }
        }
    
}
