//
//  PWLayout.swift
//  PWScrollableHeaderView
//
//  Created by Tony_Zhao on 3/30/15.
//  Copyright (c) 2015 TonyZPW. All rights reserved.
//

import UIKit

/*
需要引入自定义的变量所以需要自定义
*/
class PWLayoutAttributes: UICollectionViewLayoutAttributes{
    
    var deltaValue: CGFloat = 0
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = super.copyWithZone(zone) as PWLayoutAttributes
        copy.deltaValue = deltaValue
        return copy
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        let attr = object as PWLayoutAttributes
        
        if(attr.deltaValue == deltaValue){
            return super.isEqual(object)
        }
        return false
    }
}

class PWLayout: UICollectionViewFlowLayout{
    
    var maximumScrenchH: CGFloat = 0
    
    override class func layoutAttributesClass() -> AnyClass{
        return PWLayoutAttributes.self
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
         let layoutAttributes = super.layoutAttributesForElementsInRect(rect) as [PWLayoutAttributes]
        let contentOffsetY = collectionView!.contentOffset.y
        
        if(contentOffsetY < 0){
            let delta = fabs(contentOffsetY)
            for attr in layoutAttributes{
                if let kind = attr.representedElementKind{
                    if(kind == UICollectionElementKindSectionHeader){
                        var frame = attr.frame
                        frame.size.height = min(max(0,headerReferenceSize.height + delta),maximumScrenchH)
                        frame.origin.y = CGRectGetMinY(frame) - delta
                        attr.frame = frame
                        attr.deltaValue = delta
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        
        return true
    }
    
}