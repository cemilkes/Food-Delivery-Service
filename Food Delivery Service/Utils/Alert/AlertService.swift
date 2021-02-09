//
//  AlertService.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/9/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import UIKit

class AlertService{
    
    static let shared = AlertService()
    
    func alert(title: String, description: String, actionButtonTitle: String, cancelButtonTitle: String) -> AlertController{
        
        let storyboard = UIStoryboard(name: Storyboard.alert, bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: ViewController.alertController) as! AlertController
        
        //alertVC.imageView.image = UIImage(named: image)
        alertVC.alertTitle = title
        alertVC.alertDescription = description
        alertVC.actionButtonTitle = actionButtonTitle
        alertVC.cancelButtonTitle = cancelButtonTitle
        
        return alertVC
    }
}
