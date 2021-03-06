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
    
    @IBOutlet weak var starOne: UIImageView!
    @IBOutlet weak var starTwo: UIImageView!
    @IBOutlet weak var starThree: UIImageView!
    @IBOutlet weak var starFour: UIImageView!
    @IBOutlet weak var starFive: UIImageView!
    @IBOutlet weak var starSix: UIImageView!
    
    @IBOutlet weak var newImage: UIImageView!
    
    @IBOutlet weak var rewardImage: UIImageView!
    
    
    var delegate: SmallCardViewDelegate?
    
    var vendor: Vendor? {
        didSet {
            nameLabel.text = vendor?.name
            let font = UIFont(name: "HalisR-Medium", size: 14)
            nameLabel.font = font
            
            if vendor?.name == "Newegg" {
                rewardImage.alpha = 1.0
            }
            
            if vendor?.name == "Jinya Ramen Bar" {
                newImage.alpha = 1.0
                nameLabel.textColor = UIColor.darkGrayColor()
                if let vendor = vendor {
                    let stars = vendor.starsDates
                    let count = stars.count
                    print(count)
                    
//                    if count > 0 {
                        starOne.image = UIImage(named: "icon-home-starfilled-dark")
//                    }
//                    if count > 1 {
                        starTwo.image = UIImage(named: "icon-home-starline-dark")
//                    }
//                    if count > 2 {
                        starThree.image = UIImage(named: "icon-home-starline-dark")
//                    }
//                    if count > 3 {
                        starFour.image = UIImage(named: "icon-home-starline-dark")
//                    }
//                    if count > 4 {
                        starFive.image = UIImage(named: "icon-home-starline-dark")
//                    }
//                    if count > 5 {
                        starSix.image = UIImage(named: "icon-home-starline-dark")
//                    }
                    
                    
                }
            } else {
                
                if let vendor = vendor {
                    let stars = vendor.starsDates
                    let count = stars.count
                    print(count)
                    
                    if count > 0 {
                        starOne.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    if count > 1 {
                        starTwo.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    if count > 2 {
                        starThree.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    if count > 3 {
                        starFour.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    if count > 4 {
                        starFive.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    if count > 5 {
                        starSix.image = UIImage(named: "icon-home-starfilled-white")
                    }
                    
                    
                }
            }
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