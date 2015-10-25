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
    
    @IBOutlet weak var voucherLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var textOneLabel: UILabel!
    
    @IBOutlet weak var textTwoLabel: UILabel!
    
    
    
    class func view() -> PurchaseView {
        let kNibName = "PurchaseView"
        let nib = UINib(nibName: kNibName, bundle: NSBundle.mainBundle())
        let cardView = nib.instantiateWithOwner(self, options: nil).first as! PurchaseView
        return cardView
    }
    
    override func awakeFromNib() {
        voucherLabel.font = UIFont(name: "HalisR-Book", size: 15)
        codeLabel.font = UIFont(name: "HalisR-Medium", size: 28)
        textOneLabel.font = UIFont(name: "HalisR-Light", size: 16)
        textTwoLabel.font = UIFont(name: "HalisR-Light", size: 16)
    }
    
}