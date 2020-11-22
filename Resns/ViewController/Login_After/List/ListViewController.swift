//
//  ListViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//

import Foundation

import UIKit

class ListViewController: UIViewController ,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ナビゲーションアイテムのタイトルに画像を設定する
        let imageView = UIImageView(image:UIImage (named:"rogo_katto"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
    }
}
