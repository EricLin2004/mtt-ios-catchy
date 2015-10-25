//
//  LargeInfoCardView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class LargeInfoCardView: UICollectionViewCell {
    
    var reward: Reward? {
        didSet {
            if let reward = reward {
                if let image = reward.image {
                    if let URL = NSURL(string: image) {
                        productImage.sd_setImageWithURL(URL)
                    }
                }
            }
        }
    }

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var closeButtonOne: UIButton!
    @IBOutlet weak var closeButtonTwo: UIButton!
    
    override func awakeFromNib() {
        productImage.layer.cornerRadius = productImage.frame.size.width / 2
        productImage.clipsToBounds = true
    }
    
    class func view() -> LargeInfoCardView {
        let kNibName = "LargeInfoCardView"
        let nib = UINib(nibName: kNibName, bundle: NSBundle.mainBundle())
        let cardView = nib.instantiateWithOwner(self, options: nil).first as! LargeInfoCardView
        return cardView
    }
    
    @IBAction func purchaseButtonTapped(sender: AnyObject) {
        let purchaseView = PurchaseView.view()
        addSubview(purchaseView)
        purchaseView.frame.origin.y = 160
        purchaseView.frame.origin.x = 20
        purchaseView.alpha = 0.0
        
        UIView.animateWithDuration(0.3, animations: {
            self.nameLabel.alpha = 0.0
            self.productImage.alpha = 0.0
            self.topLabel.alpha = 0.0
            self.descriptionLabel.alpha = 0.0
            self.purchaseButton.alpha = 0.0
            //self.closeButtonOne.alpha = 0.0
            //self.closeButtonTwo.alpha = 0.0
            }, completion: {
                _ in
                UIView.animateWithDuration(0.3, animations: {
                    purchaseView.alpha = 1.0
                })
        })
        
        
    }
    
}
