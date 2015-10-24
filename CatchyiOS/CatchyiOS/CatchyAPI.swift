//
//  CatchyAPI.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import Alamofire
//import AlamofireObjectMapper

struct CatchyAPI {
    
    //TODO: completion block that takes vendors
    func getVendors(completion: ([Vendor]) -> Void) {
        
        Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                // converst JSON dict to Vendors
                // return array of vendors in completion block
        }
        
    }
    
}