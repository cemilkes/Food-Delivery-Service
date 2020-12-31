//
//  ContainerController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/30/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {


    let orderHistoryController = OrderHistoryController()
    let favouriteController = FavouriteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedController()
        // Do any additional setup after loading the view.
    }
    
    private func setupSegmentedController(){
        
        
        
        addChild(orderHistoryController)
        addChild(favouriteController)
        
        self.view.addSubview(orderHistoryController.view)
        self.view.addSubview(favouriteController.view)
        
        orderHistoryController.didMove(toParent: self)
        favouriteController.didMove(toParent: self)
        favouriteController.view.isHidden = true

    }
    
    @IBAction func didTapSegment(segment: UISegmentedControl){
        orderHistoryController.view.isHidden = true
        favouriteController.view.isHidden = true
        
        if segment.selectedSegmentIndex  == 0{
            orderHistoryController.view.isHidden = false
        }else{
            favouriteController.view.isHidden = false
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
