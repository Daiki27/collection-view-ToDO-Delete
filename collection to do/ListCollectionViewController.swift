//
//  ListCollectionViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/08.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

//タップする→セルを消す/風船が消える（音を鳴らす）→別画面で風船が増える
//labelをタップしてsave画面に戻る

import UIKit
import RealmSwift
//import AVFoundation //タップ

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController  {
    
    //個数の変数
    var todoes: Results<ToDo> = {
        let realm = try! Realm()
        return realm.objects(ToDo.self)
    }()
    
    //データの個数を返すメソッド
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section : Int) -> Int
    {
        return todoes.count;
    }
    
    //データを返すメソッド。セルの中身の表示の仕方の設定。
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        as! CollectionViewCell //セルの再利用
        
        cell.titleLabel.text = todoes[indexPath.row].title
        
        return cell
        
    }

    //＋ボタンを押した時のメソッド
    @IBAction func add() {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    //起動時に一回の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
       //collectionviewからcellが使えるようにする。
       let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
       collectionView?.register(nib, forCellWithReuseIdentifier: "Cell")
        
    }
    
    //タップ
//    func tap(_ sender: UITapGestureRecognizer){
//        
//    }
    
    //警告を受け取ったときに呼ばれるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //collectionviewのセクションの数を決定する
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
    }
    
    //別の画面でなにか情報が更新され、ビューが戻った際にそれを反映するためのメソッド
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    //タップされた時に呼び出されるメソッド
    override func collectionView(_ collectionView: UICollectionView,  didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: todoes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if segue.identifier == "toDetail" {
    
                let controller = segue.destination as! DetailViewController
                if let todo = sender as? ToDo {
                    controller.todo = todo
                }
            }
        }


    //セルの個数の指定
//      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
    
    
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//    
//        return cell
//    }


}
