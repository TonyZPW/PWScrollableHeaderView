//
//  PWReuseableHeaderView.swift
//  PWScrollableHeaderView
//
//  Created by Tony_Zhao on 3/30/15.
//  Copyright (c) 2015 TonyZPW. All rights reserved.
//

import UIKit

class PWReuseableHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var backgroundView: UIImageView!
    
    @IBOutlet weak var backgroundViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var logoView: UIImageView!
    
    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    
    private var backgroundViewH: CGFloat = 0
    private var logoH: CGFloat = 0
    private var previousH: CGFloat = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundViewH = CGRectGetHeight(backgroundView.bounds)
        logoH = CGRectGetHeight(logoView.bounds)
        
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        super.applyLayoutAttributes(layoutAttributes)
        let attr = layoutAttributes as PWLayoutAttributes
        let height = attr.frame.size.height
        if previousH != height{
            backgroundViewHeightConstraint.constant = backgroundViewH - attr.deltaValue
            logoHeightConstraint.constant = logoH + attr.deltaValue
            previousH = height
        }
        
    }
    
}