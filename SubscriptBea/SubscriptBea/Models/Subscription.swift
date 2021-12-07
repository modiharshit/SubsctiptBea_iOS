//
//  Subscription.swift
//  SubscriptBea
//
//  Created by Harshit on 06/12/21.
//  Copyright © 2021 Harshit Modi. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class Subscription: NSObject, Mappable, NSCopying, NSCoding {
    
    // MARK: Properties
    
    var id: String?
    var subscriptionTitle: String?
    var subscriptionType: String?
    var subscriptionAmount: String?
    
    init(id: String?, subscriptionTitle: String?, subscriptionType: String?, subscriptionAmount: String?) {
        self.id = id
        self.subscriptionTitle = subscriptionTitle
        self.subscriptionType = subscriptionType
        self.subscriptionAmount = subscriptionAmount
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Subscription(id: id, subscriptionTitle: subscriptionTitle, subscriptionType: subscriptionType, subscriptionAmount: subscriptionAmount)
    }
    
    override init() {
        self.id = nil
        self.subscriptionTitle = nil
        self.subscriptionType = nil
        self.subscriptionAmount = nil
    }
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        id <- map["_id"]
        subscriptionTitle <- map["subscriptionTitle"]
        subscriptionType <- map["subscriptionType"]
        subscriptionAmount <- map["subscriptionAmount"]
        
    }
    
    // MARK: NSCoding Protocol
    
    required public init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "_id") as? String
        self.subscriptionTitle = aDecoder.decodeObject(forKey: "subscriptionTitle") as? String
        self.subscriptionType = aDecoder.decodeObject(forKey: "subscriptionType") as? String
        self.subscriptionAmount = aDecoder.decodeObject(forKey: "subscriptionAmount") as? String
        
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "_id")
        aCoder.encode(subscriptionTitle, forKey: "subscriptionTitle")
        aCoder.encode(subscriptionType, forKey: "subscriptionType")
        aCoder.encode(subscriptionAmount, forKey: "subscriptionAmount")
    }
}

