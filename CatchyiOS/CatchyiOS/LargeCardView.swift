//
//  LargeCardView.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class LargeCardView: UICollectionViewCell {
    
    var vendor: Vendor? {
        didSet {
            if let name = vendor?.name {
                nameLabel.text = name
                rewardLabel.text = "view rewards items"
                switch name {
                case "Newegg":  backgroundImageView.image = UIImage(named: "bg-orange"); rewardLabel.text = "claim your reward"
                case "Super Chef": backgroundImageView.image = UIImage(named: "bg-purp")
                case "Papa Johns": backgroundImageView.image = UIImage(named: "bg-teal")
                case "JINYA Ramen Bar": backgroundImageView.image = UIImage(named: "bg-darkgrey")
                case "American Eagle": backgroundImageView.image = UIImage(named: "bg-red")
                default: backgroundImageView.image = UIImage(named: "bg-purp")
                }
            }
            locationLabel.text = vendor?.location
            
            
            if let stars = vendor?.starsDates {
                let count = stars.count
                
                if count > 0 {
                    starOne.image = UIImage(named: "icon-merchant-starhole")
                    labelOne.text = stars[0]
                }
                if count > 1 {
                    starTwo.image = UIImage(named: "icon-merchant-starhole")
                    labelTwo.text = stars[1]
                }
                if count > 2 {
                    starThree.image = UIImage(named: "icon-merchant-starhole")
                    labelThree.text = stars[2]
                }
                if count > 3 {
                    starFour.image = UIImage(named: "icon-merchant-starhole")
                    labelFour.text = stars[3]
                }
                if count > 4 {
                    starFive.image = UIImage(named: "icon-merchant-starhole")
                    labelFive.text = stars[4]
                }
                if count > 5 {
                    starSix.image = UIImage(named: "icon-merchant-starhole")
                    labelSix.text = stars[5]
                }
            }


        }
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var rewardLabel: UILabel!
    
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
    
    
    
    override func awakeFromNib() {

    }
    
}