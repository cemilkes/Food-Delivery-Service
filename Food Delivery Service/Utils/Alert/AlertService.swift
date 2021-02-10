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
    
    func alert(image: String, title: String, description: String, actionButtonTitle: String, cancelButtonTitle: String, completion: @escaping () -> Void) -> AlertController{
        
        let storyboard = UIStoryboard(name: Storyboard.alert, bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: ViewController.alertController) as! AlertController
        
        alertVC.image = image
        alertVC.alertTitle = title
        alertVC.alertDescription = description
        alertVC.actionButtonTitle = actionButtonTitle
        alertVC.cancelButtonTitle = cancelButtonTitle
        
        alertVC.didTapActionButton = completion
        //alertVC.didTapCancelButton = completion
        return alertVC
    }
}
