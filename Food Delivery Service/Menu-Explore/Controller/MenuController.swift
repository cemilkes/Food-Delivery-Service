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
import Moya

class MenuController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Variables
    var categoryArray: [Category] = []

    @IBOutlet weak var collectionView: UICollectionView!
    var locationService = LocationService()
    let alertService = AlertService()

    let service = MoyaProvider<YelpService.BusinessProvider>()
    let jsonDecoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupLocationAlert()
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        loadBusiness()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCategories()
    }

    private func loadBusiness(){
        service.request(.businessID) { (result) in
            switch result{
            case .success(let response):
                //print(try? JSONSerialization.jsonObject(with: response.data, options: []))
               let businessData = try? self.jsonDecoder.decode(Business.self, from: response.data)
                print("*************************************")
                print(businessData)
            case .failure(let error):
                print("Error is \(error)")
            }
        }
    }
    
    
    
    private func setupLocationAlert(){
        let alertControl = alertService.alert(image: "iconMapMarker", title: "Enable Your Location.", description: "Please allow to use your location to show nearby restaurant on the map.", actionButtonTitle: "Enable Location", cancelButtonTitle: "No, another time."){
            self.locationService.requestLocationAuthorization()
            
            print("Action added")
        }
        present(alertControl, animated: true)
        
        locationService.didChangeStatus = { [weak self] success in
            if success {
                self?.locationService.getLocation()
            }
        }
        
        locationService.newLocation = { [weak self] result in
            switch result {
            case .success(let location):
                print(location)
            case .failure(let error):
                assertionFailure("Error while getting the user's location\(error)")
                
            }
        }
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
