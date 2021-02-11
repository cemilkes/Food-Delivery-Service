//
//  NetworkService.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/10/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import Moya

//https://www.youtube.com/watch?v=LDEFJcdFlAU&list=PLgwcD-3WBz9lQ5NgVon61nEiFRoxs5kAT&index=10
//https://www.yelp.com/developers/documentation/v3/business
//https://www.yelp.com/biz_photos/banh-thai-restaurant-fremont
//https://medium.com/@schulte.robert/testing-yelp-api-requests-with-postman-f51450bbac83

enum YelpService {
    enum BusinessProvider:TargetType {
        case businessID
        case review
        
        var baseURL: URL{
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .businessID:
                return "/\(Constats.businessID)"
            case .review:
                return "/\(Constats.businessID)/reviews"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case .review:
                return .requestPlain
            case .businessID:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(Constats.yelpApiKey)"]
        }
    }
}
