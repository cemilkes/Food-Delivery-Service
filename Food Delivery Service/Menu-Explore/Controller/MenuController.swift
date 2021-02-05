//
//  MenuController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 8/19/20.
//  Copyright © 2020 CemilKes. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class MenuController: UIViewController, CLLocationManagerDelegate {
    
    
    // MARK: - Variables
    var categoryArray: [Category] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCategories()
    }
    
    // MARK: - Load Categories
    func loadCategories(){
        
        downloadCategoriesFromFirebase { (allCategories) in
            
            self.categoryArray = allCategories
            self.collectionView.reloadData()
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Make sure you are connecting to right segue in case of there are more than one segue from the viewcontroller to other one
        if segue.identifier == PerformSegue.menuIdentifier {
            let vc = segue.destination as! ItemsController
            vc.category = sender as? Category
            
        }
        
    }
    
    
    
    
    
}
