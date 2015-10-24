//
//  ViewController.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let API = CatchyAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.getVendors() {
            vendors in
            print("vendors \(vendors.count)")
        }
    }

}

