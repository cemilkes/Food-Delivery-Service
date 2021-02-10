//
//  NetworkService.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/10/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import Moya

enum YelpService {
    enum BusinessProvider:TargetType {
        case detail(name:String)
        case review
        
        var baseURL: URL{
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .detail:
                return "/detail"
            case .review:
                return "/id/reviews"
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
            case let .detail(name):
                return .requestParameters(parameters: ["name": name], encoding: URLEncoding.queryString)
            case .review:
                return .requestData(Data())
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(Constats.yelpApiKey)"]
        }
        
     
    }
}
