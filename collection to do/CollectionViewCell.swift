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
    //@IBOutlet var myImageView: UIImageView! //タップの関連付け
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //ダブルタップの為の準備
//    func viewDidLoad() {
//        let doubleTapGesture = UITapGestureRecognizer(target: self, action:#selector(self.doubleTap))
//        doubleTapGesture.numberOfTapsRequired = 2
//        self.myImageView.addGestureRecognizer(doubleTapGesture)
//    }
    
    //ダブルタップされた時の処理
//    func doubleTap(gesture: UITapGestureRecognizer) -> Void {
//        
//    }
    

}
