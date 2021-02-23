//
//  Feedback.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/22/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import Foundation
class Feedback{
    
    var id: String!
    var userId: String!
    var email: String!
    var topic: String!
    var detail: String!
    
    init() {}
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as? String
        userId = _dictionary["customerId"] as? String
        email = _dictionary[kEMAIL] as? String
        topic = _dictionary["topic"] as? String
        detail = _dictionary["detail"] as? String
    }
    
}
func feedBackDictionaryFrom(_ feedback: Feedback) -> NSDictionary {
    return NSDictionary(objects: [feedback.id,
                                  feedback.userId,
                                  feedback.email,
                                  feedback.topic,
                                  feedback.detail],
                        forKeys: [kOBJECTID as NSCopying,
                                  "userID" as NSCopying,
                                  kEMAIL as NSCopying,
                                  "topic" as NSCopying,
                                  "detail" as NSCopying])
}

func saveItemToFirebase(_ feedBack: Feedback){
    
    FirebaseReference(.Feedbacks).document(feedBack.id).setData(feedBackDictionaryFrom(feedBack) as! [String : Any] )
}
