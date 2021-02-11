//
//  Business.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/10/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation

struct Business: Codable {
    
    let name: String
    //let imageUrl: URL
    let isClosed:  Bool
//    let phone: String
//    let reviewCount: Int
//    let rating: Double
//    let location: Location
//    let coordinates: Coordinates
//    let hours: Hours
//    let transactions: [String]
}

struct Location: Codable {
    let address1: String
    let city: String
    let zipCode: String
    let country: String
    let state: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Hours: Codable {
    let isOpenNow: Bool
    let openHours: [OpenHours]
}

struct OpenHours: Codable {
    let start: String
    let end: String
    let day: Int
}
struct BusinessViewModel {
    let name: String
    //let imageUrl: URL
    let isClosed: Bool
//    let phone: String
//    let reviewCount: String
//    let rating: Double
}
extension BusinessViewModel {
    init(business: Business) {
        self.name = business.name
        self.isClosed = business.isClosed
    }
    
    
}
