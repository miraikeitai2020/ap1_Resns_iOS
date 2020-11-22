//
//  ProfileCheckViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/10/31.
//

import Foundation


import UIKit

class ProfileCheckSelectViewController: UIViewController, UIGestureRecognizerDelegate{
    
    
    // 選んだジャンル４つ
    let Genre1 = UIImageView(image: UIImage(named: "title-752"))
    let Genre2 = UIImageView(image: UIImage(named: "title-752"))
    let Genre3 = UIImageView(image: UIImage(named: "title-752"))
    let Genre4 = UIImageView(image: UIImage(named: "title-752"))
    
    
    // もう一度設定
    let reSelect = UIButton(type: .custom)
    
    
    // 完了ボタン
    let Finish = UIButton(type: .custom)
    
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        
        // 前画面で保持した値の受け取り
        // ジャンル
        let getGenre4:[String] = userDefaults.array(forKey: "Genre4") as! [String]
        // 性別
        let getSexual:Int = userDefaults.integer(forKey: "Sexual")
        // 年代・月・日
        let gettext1:Int = userDefaults.integer(forKey: "text1")
        let gettext2:Int = userDefaults.integer(forKey: "text2")
        let gettext3:Int = userDefaults.integer(forKey: "text3")
        
    
        // 各ボタンにセットする画像の大きさ変更
        reSelect.imageView?.contentMode = .scaleAspectFit
        reSelect.contentHorizontalAlignment = .fill
        reSelect.contentVerticalAlignment = .fill
        
        Finish.imageView?.contentMode = .scaleAspectFit
        Finish.contentHorizontalAlignment = .fill
        Finish.contentVerticalAlignment = .fill
        
        let Label1 = UILabel() // ラベルの生成
        Label1.frame = CGRect(x: 0, y: 200, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label1.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label1.text = "プロフィール確認" // テキストの設定
        Label1.textColor = UIColor.darkGray // テキストカラーの設定
        Label1.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label1) // ラベルの追加
        
        // 選んだ４つのジャンルの入れ物
        let Genre1 = UIImageView(image: UIImage(named: "ドラマ"))
        Genre1.frame = CGRect(x: 30, y: 330, width: 80, height: 45)
        self.view.addSubview(Genre1)
        
        let Genre2 = UIImageView(image: UIImage(named: "スポーツ"))
        Genre2.frame = CGRect(x: 120, y: 330, width: 80, height: 45)
        self.view.addSubview(Genre2)
        
        let Genre3 = UIImageView(image: UIImage(named: "音楽"))
        Genre3.frame = CGRect(x: 210, y: 330, width: 80, height: 45)
        self.view.addSubview(Genre3)
        
        let Genre4 = UIImageView(image: UIImage(named: "グルメ"))
        Genre4.frame = CGRect(x: 300, y: 330, width: 80, height: 45)
        self.view.addSubview(Genre4)
        
        
        // 選んだ性別を表示する場所
        let sexualLabel = UILabel() // ラベルの生成
        sexualLabel.frame = CGRect(x: 0, y: 400, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        sexualLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        if getSexual == 0{
            sexualLabel.text = "男" // テキストの設定（男）
        } else if getSexual == 1{
            sexualLabel.text = "女" // テキストの設定（女）
        } else {
            sexualLabel.text = "設定しない" // テキストの設定（設定しない）
        }
        sexualLabel.textColor = UIColor.darkGray // テキストカラーの設定
        sexualLabel.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(sexualLabel) // ラベルの追加
        
        // 入力した年代を表示する場所
        let yearLabel = UILabel() // ラベルの生成
        yearLabel.frame = CGRect(x: -55, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        yearLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        yearLabel.text = String(gettext1)// テキストの設定
        yearLabel.textColor = UIColor.darkGray // テキストカラーの設定
        yearLabel.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(yearLabel) // ラベルの追加
        // 年
        let year = UILabel() // ラベルの生成
        year.frame = CGRect(x: -20, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        year.textAlignment = NSTextAlignment.center // 横揃えの設定
        year.text = "年"// テキストの設定
        year.textColor = UIColor.darkGray // テキストカラーの設定
        year.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(year) // ラベルの追加
        
        // 入力した月を表示する場所
        let monthLabel = UILabel() // ラベルの生成
        monthLabel.frame = CGRect(x: 0, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        monthLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        monthLabel.text = String(gettext2)// テキストの設定
        monthLabel.textColor = UIColor.darkGray // テキストカラーの設定
        monthLabel.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(monthLabel) // ラベルの追加
        // 月
        let month = UILabel() // ラベルの生成
        month.frame = CGRect(x: 20, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        month.textAlignment = NSTextAlignment.center // 横揃えの設定
        month.text = "月"// テキストの設定
        month.textColor = UIColor.darkGray // テキストカラーの設定
        month.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(month) // ラベルの追加
        
        // 入力した日を表示する場所
        let dayLabel = UILabel() // ラベルの生成
        dayLabel.frame = CGRect(x: 40, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        dayLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        dayLabel.text = String(gettext3)// テキストの設定
        dayLabel.textColor = UIColor.darkGray // テキストカラーの設定
        dayLabel.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(dayLabel) // ラベルの追加
        // 日
        let day = UILabel() // ラベルの生成
        day.frame = CGRect(x: 60, y: 475, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        day.textAlignment = NSTextAlignment.center // 横揃えの設定
        day.text = "日"// テキストの設定
        day.textColor = UIColor.darkGray // テキストカラーの設定
        day.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(day) // ラベルの追加
        /*
        let Label2 = UILabel() // ラベルの生成
        Label2.frame = CGRect(x: 0, y: 520, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label2.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label2.text = "生年月日は後から変更できません" // テキストの設定
        Label2.textColor = UIColor.red// テキストカラーの設定
        Label2.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label2) // ラベルの追加
        */
        let textImage = UIImageView(image: UIImage(named: "プロフィール確認-生年月日は〜"))
        textImage.frame = CGRect(x: 100, y: 515, width: 210, height: 20)
        self.view.addSubview(textImage)
        
        // もう一度設定ボタン
        reSelect.frame = CGRect(x: 160, y: 580, width: 100, height: 45);
        // 画像を設定
        reSelect.setImage(UIImage(named: "プロフィール確認-もう1度設定"), for: UIControl.State())
        // ボタンを追加
        self.view.addSubview(reSelect)
        
        
        // 完了ボタン
        Finish.frame = CGRect(x: 150, y: 700, width: 120, height: 45);
        // ボタンに画像を設定
        Finish.setImage(UIImage(named: "プロフィール確認-完了"), for: UIControl.State())
        // ボタンを追加
        self.view.addSubview(Finish)
        
        
        
        /*
         let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
         target: self,
         action: #selector(self.tapped(_:)))
         // デリゲートをセット
         tapGesture.delegate = self
         
         self.Next.addGestureRecognizer(tapGesture)
         */
        
        
       
        
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ProfileCheckSelectViewController.reSelecttapped(_:)))
        tapGesture1.delegate = self
        self.reSelect.addGestureRecognizer(tapGesture1)
        
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ProfileCheckSelectViewController.Finishtapped(_:)))
        tapGesture2.delegate = self
        self.Finish.addGestureRecognizer(tapGesture2)
        
        
    }
    @objc func reSelecttapped(_ sender: UITapGestureRecognizer){
        //if sender.state == .ended {
            
            // GenreStoryboardのインスタンス取得
            let storyboard = UIStoryboard(name: "GenreSelect", bundle: nil)
            
            // 遷移先GenreSelectViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(identifier: "GenreSelectScreen") as! GenreSelectViewController
            
            // 画面遷移(プッシュ遷移)
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
        
        @objc func Finishtapped(_ sender: UITapGestureRecognizer){
            //if sender.state == .ended {
                
                // HomeStoryboardのインスタンス取得
                let storyboard = UIStoryboard(name: "MainTabBar", bundle: nil)
                
                // 遷移先HomeViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(identifier: "MainTabBar") as! MainTabBarController
                
                // 画面遷移(プッシュ遷移)
                self.navigationController?.pushViewController(nextView, animated: true)
                
            }
            
        }
 
   // }
//}
