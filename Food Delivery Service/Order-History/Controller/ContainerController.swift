//
//  ContainerController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 12/30/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    // Instantiate the child view controller
    
    private lazy var orderHistoryController: OrderHistoryController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Favourite", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "OrderHistoryController") as! OrderHistoryController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    private lazy var favouriteController: FavouriteController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Favourite", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "FavouriteController") as! FavouriteController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Order History", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Favourites", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)

        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    
    /*
        Add the child view controller to contain view controller
     */
    fileprivate func add(asChildViewController viewController: UIViewController) {
        // Another way to call childView controller
        //        Add Child View Controller
        //        addChild(viewController)
        //
        //        // Add Child View as Subview
        //        view.addSubview(viewController.view)
        //
        //        // Configure Child View
        //        viewController.view.frame = view.bounds
        //        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //
        //        // Notify Child View Controller
        //        viewController.didMove(toParent: self)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    /*
        Remove the child view controller from contain view controller
     */
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }

    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: favouriteController)
            add(asChildViewController: orderHistoryController)
        } else {
            remove(asChildViewController: orderHistoryController)
            add(asChildViewController: favouriteController)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
