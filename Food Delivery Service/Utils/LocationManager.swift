//
//  LocationManager.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/28/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    
    
    static let shared = LocationHandler()
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    
    
    
    
}
