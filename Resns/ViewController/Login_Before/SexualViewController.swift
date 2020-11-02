//
//  GenderViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/10/25.
//

import Foundation


import UIKit

class SexualViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // 男性ボタン
    let Male = UIButton(type: .custom)
    
    // 女性ボタン
    let Female = UIButton(type: .custom)
    
    // 設定しない
    let NoSexual = UIButton(type: .custom)
    
    // 次へ
    let Next = UIButton(type: .custom)
    
    // 各ジャンルボタンのON/OFF管理
    var flag1: Bool = false
    var flag2: Bool = false
    var flag3: Bool = false
    
    
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    var Sexual: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景を灰色に変更
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        // 各ボタンにセットする画像の大きさ変更
        Male.imageView?.contentMode = .scaleAspectFit
        Male.contentHorizontalAlignment = .fill
        Male.contentVerticalAlignment = .fill
        
        Female.imageView?.contentMode = .scaleAspectFit
        Female.contentHorizontalAlignment = .fill
        Female.contentVerticalAlignment = .fill
        
        NoSexual.imageView?.contentMode = .scaleAspectFit
        NoSexual.contentHorizontalAlignment = .fill
        NoSexual.contentVerticalAlignment = .fill
        
        Next.imageView?.contentMode = .scaleAspectFit
        Next.contentHorizontalAlignment = .fill
        Next.contentVerticalAlignment = .fill
        
        let Label1 = UILabel() // ラベルの生成
        Label1.frame = CGRect(x: 0, y: 200, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label1.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label1.text = "プロフィール設定" // テキストの設定
        Label1.textColor = UIColor.darkGray // テキストカラーの設定
        Label1.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label1) // ラベルの追加
        
        let Label2 = UILabel() // ラベルの生成
        Label2.frame = CGRect(x: 0, y: 380, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label2.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label2.text = "性別" // テキストの設定
        Label2.textColor = UIColor.darkGray // テキストカラーの設定
        Label2.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label2) // ラベルの追加
        
        // 男性
        Male.frame = CGRect(x: 80, y: 455, width: 80, height: 45);
        // 男性ボタンに画像を設定
        Male.setImage(UIImage(named: "プロフィール性別-男"), for: UIControl.State())
        // 男性ボタンを追加
        self.view.addSubview(Male)
        
        
        // 女性
        Female.frame = CGRect(x: 165, y: 455, width: 80, height: 45);
        // 女性ボタンに画像を設定
        Female.setImage(UIImage(named: "プロフィール性別-女"), for: UIControl.State())
        // 女性ボタンを追加
        self.view.addSubview(Female)
        
        
        
        // 設定しない
        NoSexual.frame = CGRect(x: 250, y: 455, width: 80, height: 45);
        // 設定しないボタンに画像を設定
        NoSexual.setImage(UIImage(named: "プロフィール性別-設定しない"), for: UIControl.State())
        // 設定しないボタンを追加
        self.view.addSubview(NoSexual)
        
        
        
        
        // 次へ
        Next.frame = CGRect(x: 165, y: 700, width: 80, height: 45);
        // 次へボタンに画像を設定
        Next.setImage(UIImage(named: "プロフィール性別-次へ"), for: UIControl.State())
        // 次へボタンを追加
        self.view.addSubview(Next)
        
        //　性別を選ぶまで「次に」ボタンを押せないようにする処理
        Next.isEnabled = false
        
        
        // 各性別ボタン（３個）にタップ時のデリゲートを追加
        // 男
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SexualViewController.tappedMale(_:)))
        tapGesture1.delegate = self
        self.Male.addGestureRecognizer(tapGesture1)
        // 女
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SexualViewController.tappedFemale(_:)))
        tapGesture2.delegate = self
        self.Female.addGestureRecognizer(tapGesture2)
        // 設定しない
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SexualViewController.tappedNoSexual(_:)))
        tapGesture3.delegate = self
        self.NoSexual.addGestureRecognizer(tapGesture3)
        
        
        // 次へボタン
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SexualViewController.tapped(_:)))
        
        tapGesture.delegate = self
        
        self.Next.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func tappedMale(_ sender: UITapGestureRecognizer){
        
        //選択時に走らせたい処理
        Next.isEnabled = true
        Male.setImage(UIImage(named: "プロフィール性別-男-選択後"), for: UIControl.State())
        Sexual = 0
        // 配列の保存
        userDefaults.set(Sexual, forKey: "Sexual")
        // userDefaultsに保存された値の取得
        let getSexual:Int = userDefaults.integer(forKey: "Sexual")
        print(getSexual)
    }
    
    @objc func tappedFemale (_ sender: UITapGestureRecognizer){
        //選択時に走らせたい処理
        Next.isEnabled = true
        Female.setImage(UIImage(named: "プロフィール性別-女-選択後"), for: UIControl.State())
        Sexual = 1
        // 配列の保存
        userDefaults.set(Sexual, forKey: "Sexual")
        // userDefaultsに保存された値の取得
        let getSexual:Int = userDefaults.integer(forKey: "Sexual")
        print(getSexual)
    }
    
    @objc func tappedNoSexual (_ sender: UITapGestureRecognizer){
        //選択時に走らせたい処理
        Next.isEnabled = true
        NoSexual.setImage(UIImage(named: "プロフィール性別-設定しない-選択後"), for: UIControl.State())
        Sexual = 2
        // 配列の保存
        userDefaults.set(Sexual, forKey: "Sexual")
        // userDefaultsに保存された値の取得
        let getSexual:Int = userDefaults.integer(forKey: "Sexual")
        print(getSexual)
    }
    
    // 「次に」ボタンを押したら年代選択画面に遷移する処理
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            
            // AgeStoryboardのインスタンス取得
            let storyboard = UIStoryboard(name: "Age", bundle: nil)
            
            // 遷移先AgeViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(identifier: "AgeScreen") as! AgeViewController
            
            // 画面遷移(プッシュ遷移)
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    /*
    // 「男」「女」「設定しない」全部を押した時のメソッド
    func selected() {
        if GenderSelect == 1 {
            // 「次に」ボタンを押せるようにする処理
            Next.isEnabled = true
            //　「女」・「設定しない」ボタンをそれぞれ押せなくする処理
            // Female.isEnabled = false
            // NoGender.isEnabled = false
        } else {
            // 「次に」ボタンを押せないようにする処理
            Next.isEnabled = false
            //　「女」・「設定しない」ボタンをそれぞれ押せるようにする処理
            //Female.isEnabled = true
            //NoGender.isEnabled = true
        }
    }
    */
    /*
    // 「男」ボタンを押した時のメソッド
    func maleSelected() {
        if GenderSelect == 1 {
            // 「次に」ボタンを押せるようにする処理
            Next.isEnabled = true
            //　「女」・「設定しない」ボタンをそれぞれ押せなくする処理
            Female.isEnabled = false
            NoGender.isEnabled = false
        } else {
            // 「次に」ボタンを押せないようにする処理
            Next.isEnabled = false
            //　「女」・「設定しない」ボタンをそれぞれ押せるようにする処理
            Female.isEnabled = true
            NoGender.isEnabled = true
        }
    }
    
    func femaleSelected() {
        if GenderSelect == 1 {
            // 「次に」ボタンを押せるようにする処理
            Next.isEnabled = true
            //　「男」・「設定しない」ボタンをそれぞれ押せなくする処理
            Male.isEnabled = false
            NoGender.isEnabled = false
        } else {
            // 「次に」ボタンを押せないようにする処理
            Next.isEnabled = false
            //　「男」・「設定しない」ボタンをそれぞれ押せるようにする処理
            Male.isEnabled = true
            Female.isEnabled = true
        }
    }
    
    func nogenderSelected() {
        if GenderSelect == 1 {
            // 「次に」ボタンを押せるようにする処理
            Next.isEnabled = true
            //　「男」・「女」ボタンをそれぞれ押せなくする処理
            Male.isEnabled = false
            Female.isEnabled = false
        } else {
            // 「次に」ボタンを押せないようにする処理
            Next.isEnabled = false
            //　「男」・「女」ボタンをそれぞれ押せるようにする処理
            Male.isEnabled = true
            Female.isEnabled = true
        }
    }
 */
    
}
