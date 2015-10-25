//
//  LargeCardView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class LargeCardView: UICollectionViewCell, PurchaseDelegate

{
    
    var vendor: Vendor? {
        didSet {
            if let name = vendor?.name {
                nameLabel.text = name
                switch name {
                case "Newegg":  backgroundImageView.image = UIImage(named: "bg-orange")
                case "Super Chef": backgroundImageView.image = UIImage(named: "bg-purp")
                case "Papa Johns": backgroundImageView.image = UIImage(named: "bg-teal")
                case "JINYA Ramen Bar": backgroundImageView.image = UIImage(named: "bg-darkgrey")
                case "American Eagle": backgroundImageView.image = UIImage(named: "bg-red")
                default: backgroundImageView.image = UIImage(named: "bg-purp")
                }
            }
            locationLabel.text = vendor?.location
            
            realStarOne.alpha = 0.0
            realStarTwo.alpha = 0.0
            realStarThree.alpha = 0.0
            realStarFour.alpha = 0.0
            realStarFive.alpha = 0.0
            realStarSix.alpha = 0.0
            
            
            if let stars = vendor?.starsDates {
                let count = stars.count
                
                if count > 0 {
                    starOne.image = UIImage(named: "icon-merchant-starhole")
                    labelOne.text = stars[0]
                    realStarOne.alpha = 1.0
                }
                if count > 1 {
                    starTwo.image = UIImage(named: "icon-merchant-starhole")
                    labelTwo.text = stars[1]
                    realStarTwo.alpha = 1.0
                }
                if count > 2 {
                    starThree.image = UIImage(named: "icon-merchant-starhole")
                    labelThree.text = stars[2]
                    realStarThree.alpha = 1.0
                }
                if count > 3 {
                    starFour.image = UIImage(named: "icon-merchant-starhole")
                    labelFour.text = stars[3]
                    realStarFour.alpha = 1.0
                }
                if count > 4 {
                    starFive.image = UIImage(named: "icon-merchant-starhole")
                    labelFive.text = stars[4]
                    realStarFive.alpha = 1.0
                }
                if count > 5 {
                    starSix.image = UIImage(named: "icon-merchant-starhole")
                    labelSix.text = stars[5]
                    realStarSix.alpha = 1.0
                }
            }


        }
    }
    
    var delegate: PurchaseDelegate?

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var starOne: UIImageView!
    @IBOutlet weak var starTwo: UIImageView!
    @IBOutlet weak var starThree: UIImageView!
    @IBOutlet weak var starFour: UIImageView!
    @IBOutlet weak var starFive: UIImageView!
    @IBOutlet weak var starSix: UIImageView!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    
    @IBOutlet weak var realStarOne: UIImageView!
    @IBOutlet weak var realStarTwo: UIImageView!
    @IBOutlet weak var realStarThree: UIImageView!
    @IBOutlet weak var realStarFour: UIImageView!
    @IBOutlet weak var realStarFive: UIImageView!
    @IBOutlet weak var realStarSix: UIImageView!
    
    
    @IBOutlet weak var giftImage: UIImageView!
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {

    }
    
    @IBAction func bottomViewTapped(sender: AnyObject) {
        
        let starDropPoint: CGFloat = 505
        
        if vendor?.name != "Newegg" {
            UIView.animateWithDuration(0.3, animations: {
                self.bottomViewHeightConstraint.constant = 512
                self.layoutIfNeeded()
                self.giftImage.alpha = 0.0
                
                }, completion: {
                    _ in
                    let rewardView = LargeRewardCardView.view()
                    rewardView.rewards = self.vendor?.rewards
                    rewardView.delegate = self
                    self.bottomView.addSubview(rewardView)
            })
        } else {
            UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarOne.frame.origin.y = starDropPoint
                }, completion: {
                    _ in
            })
            
            UIView.animateWithDuration(0.5, delay: 0.4, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarTwo.frame.origin.y = starDropPoint
                }, completion: {
                    _ in

            })
            
            UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarThree.frame.origin.y = starDropPoint
                }, completion: {
                    _ in

            })
            
            UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarFour.frame.origin.y = starDropPoint
                }, completion: {
                    _ in

                })
            
            UIView.animateWithDuration(0.5, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarFive.frame.origin.y = starDropPoint
                }, completion: {
                    _ in
                    
                    UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                        self.bottomViewHeightConstraint.constant = 512
                        self.layoutIfNeeded()
                        self.giftImage.alpha = 0.0
                        
                        self.realStarOne.alpha = 0.0
                        self.realStarTwo.alpha = 0.0
                        self.realStarThree.alpha = 0.0
                        self.realStarFour.alpha = 0.0
                        self.realStarFive.alpha = 0.0
                        self.realStarSix.alpha = 0.0
                        
                        }, completion: {
                            _ in
                            let rewardView = LargeRewardCardView.view()
                            rewardView.rewards = self.vendor?.rewards
                            rewardView.delegate = self
                            self.bottomView.addSubview(rewardView)
                            self.bringSubviewToFront(rewardView)
                            
                            
                    })

                    
            })
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.realStarSix.frame.origin.y = starDropPoint
                }, completion: {
                    _ in

            })
            
            
        }
    }
    
    func showPurchaseView(reward: Reward) {
        delegate?.showPurchaseView(reward)
    }
}