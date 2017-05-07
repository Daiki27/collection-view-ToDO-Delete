//
//  ListCollectionViewController.swift
//  collection to do
//
//  Created by 樋口大樹 on 2017/05/08.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController {
    
    //個数の変数
    var todoes: Results<ToDo> = {
        let realm = try! Realm()
        return realm.objects(ToDo.self)
    }()
    
    //データの個数を返すメソッド
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section : Int) -> Int
    {
        return todoes.count;
    }
    
    //データを返すメソッド
    func collectionView(collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withIdentifier: "Cell") //セルの再利用
        cell?.textLabel?.text = todoes[indexPath.row].title
        return cell!
        
        //セルの背景色をランダムに設定する。
        cell.backgroundColor = UIColor(red: CGFloat(drand48()),
                                       green: CGFloat(drand48()),
                                       blue: CGFloat(drand48()),
                                       alpha: 1.0)
    }

    //＋ボタンを押した時のメソッド
    @IBAction func add() {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    //起動時に一回の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
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
    func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetail", sender: todoes[indexPath.row])
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        return cell
    }


}
