//
//  ProfileController.swift
//  Food Delivery Service
//
//  Created by Cemil Keş on 10/27/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit


struct CellModel {
    
    var imageName: String!
    var description: String!
    
}
class ProfileController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        
        let cellArray = [
            CellModel(imageName: "", description: ""),
            CellModel(imageName: "", description: ""),
                        
        ]
        
        
        
        
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
