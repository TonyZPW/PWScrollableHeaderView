//
//  ViewController.swift
//  PWScrollableHeaderView
//
//  Created by Tony_Zhao on 3/30/15.
//  Copyright (c) 2015 TonyZPW. All rights reserved.
//  哥QQ:1207303259

import UIKit

class ViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = CGRectGetWidth(collectionView!.bounds)
        
        let layout = collectionViewLayout as PWLayout
        
        layout.maximumScrenchH = 400 //最大可拉伸高度限制为400
        
        layout.headerReferenceSize = CGSize(width: width, height: 180) //设置Header的大小
        
        layout.itemSize = CGSize(width: width, height: 62)//设置每个Cell的大小
    }
}

extension ViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath) as PWReuseableHeaderView
        return header
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.lightGrayColor()
        return cell
    }
    
}

