//
//  Reward.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation

struct Reward {
    var name: String?
    var descriptionText: String?
    var image: String?
    var price: Int?
    
    mutating func updateWithDictionary(dict: [String: AnyObject]) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let descriptionText = dict["description"] as? String {
            self.descriptionText = descriptionText
        }
        if let image = dict["image"] as? String {
            self.image = image
        }
        if let price = dict["price"] as? Int {
            self.price = price
        }
        
    }
}