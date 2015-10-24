//
//  ViewController.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    let API = CatchyAPI()
    var vendors = [Vendor]()
    var cards = [UIView]()
    let initialCardRect = CGRect(x: 50, y: 0, width: 275, height: 450)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.getVendors() {
            vendors in
            self.vendors = vendors
            self.vendors.append(vendors.first!)
            self.vendors.append(vendors.first!)
            self.vendors.append(vendors.first!)
            self.createCardsForVendors()
            print("vendors \(vendors.count)")
        }
        
        scrollView.delegate = self
    }
    
    func createCardsForVendors() {
        for vendor in vendors {
            let card = UIView(frame: initialCardRect)
            card.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255))/255, green: CGFloat(arc4random_uniform(255))/255, blue: CGFloat(arc4random_uniform(255))/255, alpha: 1)
            //TODO: Have an actual view for the card, setup the view with the vendor properties
            cards.append(card)
            containerView.addSubview(card)
        }
        positionCards()
    }
    
    func positionCards() {
        let offsetPerCard: CGFloat = 70
        let widthScalingRatio: CGFloat = 0.3
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

}

