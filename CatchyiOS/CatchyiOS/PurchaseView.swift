//
//  PurchaseView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-25.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class PurchaseView: UIView {
    
    
    class func view() -> PurchaseView {
        let kNibName = "PurchaseView"
        let nib = UINib(nibName: kNibName, bundle: NSBundle.mainBundle())
        let cardView = nib.instantiateWithOwner(self, options: nil).first as! PurchaseView
        return cardView
    }
}