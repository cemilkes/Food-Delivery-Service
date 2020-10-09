//
//  ItemDetailController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 10/6/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailController: UIViewController {
    
    
    var item:Item!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        if item != nil{
            self.title = item.name
            print(item.name)
            
        }
    }
    
}
