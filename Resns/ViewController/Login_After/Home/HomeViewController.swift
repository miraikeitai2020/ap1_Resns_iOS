//
//  HomeViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//


import Foundation

import UIKit

class HomeViewController: UIViewController {
   
    // ジャンルButtonを生成
        // ジャンル１
        let GenreButton1  = UIButton(type: .custom)
        // ジャンル2
        let GenreButton2  = UIButton(type: .custom)
        // ジャンル3
        let GenreButton3  = UIButton(type: .custom)
        // ジャンル4
        let GenreButton4  = UIButton(type: .custom)
    
    
    
    
    
    

    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        
        // GenreButton1にセットする画像の大きさ変更
        GenreButton1.imageView?.contentMode = .scaleAspectFit
        GenreButton1.contentHorizontalAlignment = .fill
        GenreButton1.contentVerticalAlignment = .fill
        
        // GenreButton2セットする画像の大きさ変更
        GenreButton2.imageView?.contentMode = .scaleAspectFit
        GenreButton2.contentHorizontalAlignment = .fill
        GenreButton2.contentVerticalAlignment = .fill
        
        // GenreButton3セットする画像の大きさ変更
        GenreButton3.imageView?.contentMode = .scaleAspectFit
        GenreButton3.contentHorizontalAlignment = .fill
        GenreButton3.contentVerticalAlignment = .fill

        // GenreButton4セットする画像の大きさ変更
        GenreButton4.imageView?.contentMode = .scaleAspectFit
        GenreButton4.contentHorizontalAlignment = .fill
        GenreButton4.contentVerticalAlignment = .fill


    
    // ジャンルButtonを生成
        
        // ジャンル1
        GenreButton1.frame = CGRect(x: -40, y: -80, width: 525, height: 400);
        // GenreButton1に画像を設定
        GenreButton1.setImage(UIImage(named: "グループ 2218"), for: UIControl.State())
        // GenreButton1を追加
        self.view.addSubview(GenreButton1)
        
        
        // ジャンル２
        GenreButton2.frame = CGRect(x: 65, y: -80, width: 525, height: 400);
        // GenreButton2に画像を設定
        GenreButton2.setImage(UIImage(named: "グループ 2219"), for: UIControl.State())
        // GenreButton2を追加
        self.view.addSubview(GenreButton2)
        
        // ジャンル３
        GenreButton3.frame = CGRect(x: 170, y: -80, width: 525, height: 400);
        // GenreButton3に画像を設定
        GenreButton3.setImage(UIImage(named: "グループ 2220"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton3)
        
        // ジャンル４
        GenreButton4.frame = CGRect(x: 275, y: -80, width: 525, height: 400);
        // GenreButton4に画像を設定
        GenreButton4.setImage(UIImage(named: "グループ 2221"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton4)
        
       
    
        
    }

    
    
    
    @IBAction func NewsImageTap(_ sender: Any) {
        // HomeStoryboardのインスタンス取得
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
                
                // 遷移先NewsViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(identifier: "NewsScreen") as! NewsViewController
                
                // 画面遷移(プッシュ遷移)
                self.navigationController?.pushViewController(nextView, animated: true)
    }
}

