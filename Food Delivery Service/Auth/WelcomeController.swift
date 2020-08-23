//
//  WelcomeController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/22/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var welcomeTopLabel: WelcomeLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTopLabel.text = "DELIVERED FAST FOOD TO YOUR DOOR"
        welcomeTopLabel.font = Font(.system(.AvenirBlack), size: .standart(.h1)).instance
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

}
