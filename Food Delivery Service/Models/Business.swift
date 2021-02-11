//
//  Business.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/10/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import CoreLocation

struct Business: Decodable {
    
    let name: String
    let photos: [URL]
    let imageUrl: URL
    let isClosed:  Bool
    let phone: String
    let reviewCount: Int
    let rating: Double
    //let location: Location
    let coordinates: CLLocationCoordinate2D
    //let hours: Hours
//    let transactions: [String]
}

struct Location: Decodable {
    let address1: String
    let city: String
    let zipCode: String
    let country: String
    let state: String
}

struct Coordinates: Decodable {
    let latitude: Double
    let longitude: Double
}

struct Hours: Decodable {
    let isOpenNow: Bool
    let openHours: [OpenHours]
}

struct OpenHours: Decodable {
    let start: String
    let end: String
    let day: Int
}
struct BusinessViewModel {
    let name: String
    let imageUrl: URL
    let isClosed: Bool
    let phone: String
    let reviewCount: Int
    let rating: Double
    let photos: [URL]
    let coordinates:CLLocationCoordinate2D
}
extension BusinessViewModel {
    init(business: Business) {
        self.name = business.name
        self.imageUrl = business.imageUrl
        self.isClosed = business.isClosed
        self.phone = business.phone
        self.reviewCount = business.reviewCount
        self.rating = business.rating
        self.photos = business.photos
        self.coordinates = business.coordinates
    }
}

extension CLLocationCoordinate2D: Decodable{
    enum CodingKeys: CodingKey{
        case latitude
        case longitude
    }
    public init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: CodingKeys.latitude)
        let longitude = try container.decode(Double.self, forKey: CodingKeys.longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}


/*
 var formattedDistance: String {
    return BusinessViewModel.numberFormatter.string(from distance as NSNumber)
 }
 
 */
