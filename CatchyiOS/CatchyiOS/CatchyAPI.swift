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
    
    let headers = [ "x-api-token": "BM6vKWXbCqmoQKn9TPqK" ]
    
    //TODO: completion block that takes vendors
    func getVendors(completion: ([Vendor]) -> Void) {
        
        Alamofire.request(.GET, "https://catchy.herokuapp.com/v1/users/fh123", headers: headers)
            .responseJSON { response in

                var vendors = [Vendor]()
                
                if let JSON = response.result.value {
                    if let vendorsArray = JSON["vendors"] as? [[String: AnyObject]] {
                        for vendorDict in vendorsArray {
                            var vendor = Vendor()
                            vendor.updateWithDictionary(vendorDict)
                            vendors.append(vendor)
                        }
                    }
                }
                
                completion(vendors)
        }
        
    }
    
}