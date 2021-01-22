//
//  AlgoliaService.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 1/21/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
import AlgoliaSearchClient

class AlgoliaService{
    
    static let shared = AlgoliaService()
    
    let client = SearchClient(appID: "", apiKey: "")
        
    lazy var index = client.index(withName: "Item_Name")
        
    private init(){}
    
    

}

