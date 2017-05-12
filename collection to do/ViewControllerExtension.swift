//
//  ViewControllerExtension.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/12.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate {
    
    override func collectionView(_ collectionView: UICollectionView, commit editingStyle: UICollectionViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath) -> [UICollectionViewRowAction]? {
        
        // スワイプでDeleteボタンを表示
        let delete = UICollectionViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            
            collectionView.isEditing = false
            // 該当のデータを定数に代入
            let item = self.realm.objects(ToDoModel.self)[indexPath.row]
            // 該当のデータをデータベースを削除する
            try! self.realm.write {
                self.realm.delete(item
                )
            }
            // UITableViewから削除する
            collectionView.deleteRows(at: [indexPath], with: .fade)
        }
        
        delete.backgroundColor = UIColor.red
        
}

}
