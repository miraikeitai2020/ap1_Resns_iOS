//
//  SearchViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//

import Foundation

import UIKit

class SearchViewController: UIViewController ,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        //ナビゲーションアイテムのタイトルに画像を設定する
        let imageView = UIImageView(image:UIImage (named:"rogo_katto"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        
        
        // UITextFieldを生成
        let textField = UITextField()
        textField.frame = CGRect(x: 100, y: 100, width: 200, height: 38)
        // プレースホルダを設定
        textField.placeholder = "タグ検索"
        // キーボードタイプを指定
        textField.keyboardType = .default
        // 枠線のスタイルを設定
        textField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        textField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        // UITextFieldを追加
        self.view.addSubview(textField)
        // デリゲートを指定
        // 右スワイプのインスタンス
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swiped1(_:)))
        leftSwipeGesture.direction = .left
        view.addGestureRecognizer(leftSwipeGesture)
    }
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        return true
    }

    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Clear")
        return true
    }

    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }

    // テキストフィールドでの編集が終了する直前での処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }
    @objc func swiped1(_ sender: UISwipeGestureRecognizer){
        print("ボボボーボボーボボ")
    }
}

