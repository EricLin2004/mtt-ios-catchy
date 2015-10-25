//
//  DetailViewController.swift
//  CatchyiOS
//
//  Created by Flynn Howling on 2015-10-24.
//  Copyright © 2015 Axiom Zen. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var navBarTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vendor: Vendor?
    var delegate: DetailDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let largeCardViewNib = UINib(nibName: "LargeCardView", bundle: NSBundle.mainBundle())
        collectionView?.registerNib(largeCardViewNib, forCellWithReuseIdentifier: "LargeCardView")
        let largeRewardCardViewNib = UINib(nibName: "LargeRewardCardView", bundle: NSBundle.mainBundle())
        collectionView?.registerNib(largeRewardCardViewNib, forCellWithReuseIdentifier: "LargeRewardCardView")
        let largeInfoCardViewNib = UINib(nibName: "LargeInfoCardView", bundle: NSBundle.mainBundle())
        collectionView?.registerNib(largeInfoCardViewNib, forCellWithReuseIdentifier: "LargeInfoCardView")
    }
    
    class func viewController() -> DetailViewController {
        let kStoryboardName = "Main"
        let storyboard = UIStoryboard(name: kStoryboardName, bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        return viewController
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LargeCardView", forIndexPath: indexPath) as! LargeCardView
            if let vendor = vendor {
                cell.vendor = vendor
            }
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LargeRewardCardView", forIndexPath: indexPath) as! LargeRewardCardView
            if let vendor = vendor {
                cell.rewards = vendor.rewards
            }
            return cell
        }
        
//        if indexPath.row == 2 {
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LargeInfoCardView", forIndexPath: indexPath) as! LargeInfoCardView
//            return cell
//        }
        
        
        // Default
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LargeCardView", forIndexPath: indexPath) as! LargeCardView
        return cell
    }
    
    
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        delegate?.backButtonTapped()
        navigationController?.popViewControllerAnimated(false)
    }
    
    
}