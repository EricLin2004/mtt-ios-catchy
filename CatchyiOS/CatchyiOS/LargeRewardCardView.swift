//
//  LargeRewardCardView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class LargeRewardCardView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var titleOne: UILabel!
    @IBOutlet weak var titleTwo: UILabel!
    @IBOutlet weak var titleThree: UILabel!
    @IBOutlet weak var descriptionOne: UILabel!
    @IBOutlet weak var descriptionTwo: UILabel!
    @IBOutlet weak var descriptionThree: UILabel!
    
    var delegate: PurchaseDelegate?
    
    var rewards: [Reward]? {
        didSet {
            if let rewards = rewards {
                let count = rewards.count
                if count > 0 {
                    if let imageString = rewards[0].image {
                        if let URL = NSURL(string: imageString) {
                            imageOne.sd_setImageWithURL(URL)
                        }
                    }
                    titleOne.text = rewards[0].name
                    descriptionOne.text = rewards[0].descriptionText
                }
                
                if count > 1 {
                    if let imageString = rewards[1].image {
                        if let URL = NSURL(string: imageString) {
                            imageTwo.sd_setImageWithURL(URL)
                        }
                    }
                    titleTwo.text = rewards[1].name
                    descriptionTwo.text = rewards[1].descriptionText
                }
                
                if count > 2 {
                    if let imageString = rewards[2].image {
                        if let URL = NSURL(string: imageString) {
                            imageThree.sd_setImageWithURL(URL)
                        }
                    }
                    titleThree.text = rewards[2].name
                    descriptionThree.text = rewards[2].descriptionText
                }
            }
            

            
        }
    }
    
    class func view() -> LargeRewardCardView {
        let kNibName = "LargeRewardCardView"
        let nib = UINib(nibName: kNibName, bundle: NSBundle.mainBundle())
        let cardView = nib.instantiateWithOwner(self, options: nil).first as! LargeRewardCardView
        return cardView
    }
    
    override func awakeFromNib() {
        
//        backgroundImage.image = UIImage(named: "bg-grey")
        
        imageOne.layer.cornerRadius = imageOne.frame.size.width / 2
        imageTwo.layer.cornerRadius = imageTwo.frame.size.width / 2
        imageThree.layer.cornerRadius = imageThree.frame.size.width / 2
        
        imageOne.clipsToBounds = true
        imageTwo.clipsToBounds = true
        imageThree.clipsToBounds = true
        
        nameLabel.font = UIFont(name: "HalisR-Medium", size: 21)
        
        titleOne.font = UIFont(name: "HalisR-Book", size: 12)
        titleTwo.font = UIFont(name: "HalisR-Book", size: 12)
        titleThree.font = UIFont(name: "HalisR-Book", size: 12)
        descriptionOne.font = UIFont(name: "HalisR-Book", size: 11)
        descriptionTwo.font = UIFont(name: "HalisR-Book", size: 11)
        descriptionThree.font = UIFont(name: "HalisR-Book", size: 11)

    }
    
    
    @IBAction func topRewardTapped(sender: AnyObject) {
        if let reward = rewards?.first {
            delegate?.showPurchaseView(reward)

        }
    }
    
    
}
