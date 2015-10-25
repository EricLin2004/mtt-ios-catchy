//
//  smallCardView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class SmallCardView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var delegate: SmallCardViewDelegate?
    
    var vendor: Vendor? {
        didSet {
            nameLabel.text = vendor?.name
        }
    }
    
    class func view() -> SmallCardView {
        let kNibName = "SmallCardView"
        let nib = UINib(nibName: kNibName, bundle: NSBundle.mainBundle())
        let cardView = nib.instantiateWithOwner(self, options: nil).first as! SmallCardView
        return cardView
    }

    @IBAction func cardTapped(sender: AnyObject) {
        if let name = vendor?.name {
            if let delegate = delegate {
                delegate.cardTappedWithName(name)
            }
        }
    }
    
}