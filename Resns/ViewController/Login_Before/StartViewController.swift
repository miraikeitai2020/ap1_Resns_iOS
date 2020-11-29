//
//  StartViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/11/23.
//

import Foundation


import UIKit

class StartViewController: UIViewController, UIGestureRecognizerDelegate  {
    
    // ログイン
    let Login = UIButton(type: .custom)
    // 新規登録
    let NewUser = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景を灰色に
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // ボタンの位置とサイズを設定
        Login.frame = CGRect(x:135, y:350, width:140, height:50)
        // ボタンのタイトルを設定
        Login.setTitle("ログイン", for:UIControl.State.normal)
        // タイトルの色
        Login.setTitleColor(UIColor.black, for: .normal)
        // ボタンのフォントサイズ
        Login.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        // 背景色
        Login.backgroundColor = UIColor.white
        Login.layer.masksToBounds = true  // 角に丸みをつける
        Login.layer.cornerRadius = 25.0   // 丸みのサイズを設定する
        Login.layer.borderWidth = 2       // 枠線の太さを設定する.
        Login.layer.borderColor = UIColor.black.cgColor // 枠線の色をグレーに設定する.
        // Viewにボタンを追加
        self.view.addSubview(Login)
        
        // ボタンの位置とサイズを設定
        NewUser.frame = CGRect(x:115, y:500, width:180, height:50)
        // ボタンのタイトルを設定
        NewUser.setTitle("新規登録", for:UIControl.State.normal)
        // タイトルの色
        NewUser.setTitleColor(UIColor.black, for: .normal)
        // ボタンのフォントサイズ
        NewUser.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        // 背景色
        NewUser.backgroundColor = UIColor.white
        NewUser.layer.masksToBounds = true  // 角に丸みをつける
        NewUser.layer.cornerRadius = 25.0   // 丸みのサイズを設定する
        NewUser.layer.borderWidth = 2       // 枠線の太さを設定する.
        NewUser.layer.borderColor = UIColor.black.cgColor // 枠線の色をグレーに設定する.
        // Viewにボタンを追加
        self.view.addSubview(NewUser)
        
        // ログインろ新規登録の２つにタップ時のデリゲートを追加
        // ログインボタン
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(StartViewController.tappedLogin(_:)))
        tapGesture1.delegate = self
        self.Login.addGestureRecognizer(tapGesture1)
        // 新規登録ボタン
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(StartViewController.tappedNewUser(_:)))
        tapGesture2.delegate = self
        self.NewUser.addGestureRecognizer(tapGesture2)
    }
    @objc func tappedLogin(_ sender: UITapGestureRecognizer){
        // HomeStoryboardのインスタンス取得
        let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        // 遷移先HomeiewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(identifier: "MainTabBar") as! MainTabBarController
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
        
    }
    @objc func tappedNewUser(_ sender: UITapGestureRecognizer){
        // GenreSelectStoryboardのインスタンス取得
        let storyboard = UIStoryboard(name: "GenreSelect", bundle: nil)
        // 遷移先GenreSelectViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(identifier: "GenreSelectScreen") as! GenreSelectViewController
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
