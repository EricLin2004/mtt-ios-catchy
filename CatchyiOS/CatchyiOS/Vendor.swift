//
//  Vendor.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation

struct Vendor {
    var name: String?
    var location: String?
    var starsRequired: Int?
    var starsDates = [String]()
    var rewards = [Reward]()
        
    mutating func updateWithDictionary(dict: [String: AnyObject]) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let location = dict["location"] as? String {
            self.location = location
        }
        if let starsRequired = dict["stars_required"] as? Int {
            self.starsRequired = starsRequired
        }
        if let starsArray = dict["stars"] as? [[String: AnyObject]] {
            for starDict in starsArray {
                if let starDate = starDict["created_at"] as? String {
                    self.starsDates.append(starDate)
                }
            }
        }
        if let rewardsArray = dict["rewards"] as? [[String: AnyObject]] {
            for rewardDict in rewardsArray {
                var reward = Reward()
                reward.updateWithDictionary(rewardDict)
                rewards.append(reward)
            }
        }
        
    }

}