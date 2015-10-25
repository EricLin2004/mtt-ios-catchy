//
//  ViewController.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import UIKit

protocol SmallCardViewDelegate {
    func cardTappedWithName(name: String)
}

protocol DetailDelegate {
    func backButtonTapped()
}

class ViewController: UIViewController, UIScrollViewDelegate, SmallCardViewDelegate, DetailDelegate {
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    let API = CatchyAPI()
    var vendors = [Vendor]()
    var cards = [SmallCardView]()
    let initialCardRect = CGRect(x: 20, y: 0, width: 335, height: 450)
    var activeCard: SmallCardView?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.getVendors() {
            vendors in
            self.vendors = vendors
            self.createCardsForVendors()
            print("vendors \(vendors.count)")
        }
        
        scrollView.delegate = self
    }
    
    func createCardsForVendors() {
        for vendor in vendors {
            let card = SmallCardView.view()
            
            if let name = vendor.name {
                switch name {
                case "Newegg": card.imageView.image = UIImage(named: "bg-orange")
                case "Super Chef": card.imageView.image = UIImage(named: "bg-purp")
                case "Papa Johns": card.imageView.image = UIImage(named: "bg-teal")
                case "JINYA Ramen Bar": card.imageView.image = UIImage(named: "bg-darkgrey")
                case "American Eagle": card.imageView.image = UIImage(named: "bg-red")
                default: card.imageView.image = UIImage(named: "bg-purp")
                }
            }
            
            
            card.vendor = vendor
            card.delegate = self
            cards.append(card)
            containerView.addSubview(card)
        }
        positionCards()
    }
    
    func positionCards() {
        let offsetPerCard: CGFloat = 90
        let widthScalingRatio: CGFloat = 0.2
        let contentOffset: CGFloat = scrollView.contentOffset.y
        for (index, card) in cards.enumerate() {
            // Set Origin
            let scrollEffectivenessModifier = contentOffset * 0.3
            let minOrigin = CGFloat(index) * offsetPerCard + scrollEffectivenessModifier
            let origin = max(contentOffset, minOrigin)
            card.frame.origin.y = origin
            
            // Set Width
            let widthAdjustment = (contentOffset - origin) * widthScalingRatio
            card.frame.origin.x = initialCardRect.origin.x + (widthAdjustment / 2)
            card.frame.size.width = initialCardRect.size.width - widthAdjustment
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        positionCards()
    }
    
    func cardTappedWithName(name: String) {
        for card in cards {
            
            // Tapped Card
            if card.vendor?.name == name {
                activeCard = card
                
                UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                        card.frame.origin.y = 26
                        card.frame.size.height = 552
                        card.imageView.frame.size.width = 365
                        card.frame.size.width = 365
                        card.frame.origin.x = 5
                    card.nameLabel.alpha = 0.0
                    card.starOne.alpha = 0.0
                    card.starTwo.alpha = 0.0
                    card.starThree.alpha = 0.0
                    card.starFour.alpha = 0.0
                    card.starFive.alpha = 0.0
                    card.starSix.alpha = 0.0
                    
                    }, completion: { _ in
                        let detailVC = DetailViewController.viewController()
                        detailVC.vendor = card.vendor
                        detailVC.delegate = self
                        self.navigationController?.pushViewController(detailVC, animated: false)
                })
                
            } else {
                // The Rest
                UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    card.frame.origin.y = 600
                    }, completion: { _ in
                
                })
            }
        }
    }
    
    
    func backButtonTapped() {
        for card in cards {
            
            // Tapped Card
            if card.vendor?.name == activeCard?.vendor?.name {
                activeCard = nil
                
                UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    card.frame.origin.y = 200
                    card.frame.size.height = 450
                    card.imageView.frame.size.width = 335
                    card.frame.size.width = 335
                    card.frame.origin.x = 20
                    card.nameLabel.alpha = 1.0
                    card.starOne.alpha = 1.0
                    card.starTwo.alpha = 1.0
                    card.starThree.alpha = 1.0
                    card.starFour.alpha = 1.0
                    card.starFive.alpha = 1.0
                    card.starSix.alpha = 1.0
                    
                    }, completion: { _ in
                        
                })
                
            } else {
                // The Rest
                UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    card.frame.origin.y = 200
                    }, completion: { _ in
                        self.positionCards()
                        
                })
            }
        }

    }
    
}

