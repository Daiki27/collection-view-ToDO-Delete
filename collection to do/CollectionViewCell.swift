//
//  CollectionViewCell.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/08.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    //@IBOutlet var singlerecognizer: UITapGestureRecognizer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        //タップ
//        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(ListCollectionViewController.tap(_:)))
//        
//        //タップ
//        tapGesture.delegate = self as? UIGestureRecognizerDelegate;
        
    }

}
