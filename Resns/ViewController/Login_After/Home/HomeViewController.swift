//
//  HomeViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//


import Foundation

import UIKit

class HomeViewController: UIViewController ,UIGestureRecognizerDelegate{
   
    // ジャンルButtonを生成
        // ジャンル１
        let GenreButton1  = UIButton(type: .custom)
        // ジャンル2
        let GenreButton2  = UIButton(type: .custom)
        // ジャンル3
        let GenreButton3  = UIButton(type: .custom)
        // ジャンル4
        let GenreButton4  = UIButton(type: .custom)
        // 年代
        let YearButton  = UIButton(type: .custom)
        // 月
        let MonthButton  = UIButton(type: .custom)
    
    
    
    @IBOutlet weak var NewsImage: UIImageView!
    
    @IBOutlet weak var NewsImage2: UIImageView!
    
    @IBOutlet weak var NewsImage3: UIImageView!
    
    @IBOutlet weak var NewsImage4: UIImageView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
                
        //ナビゲーションアイテムのタイトルに画像を設定する
        let imageView = UIImageView(image:UIImage(named:"rogo_katto"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
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
        
        // YearButtonにセットする画像の大きさ変更
        YearButton.imageView?.contentMode = .scaleAspectFit
        YearButton.contentHorizontalAlignment = .fill
        YearButton.contentVerticalAlignment = .fill
        
        // MonthButtonにセットする画像の大きさ変更
        MonthButton.imageView?.contentMode = .scaleAspectFit
        MonthButton.contentHorizontalAlignment = .fill
        MonthButton.contentVerticalAlignment = .fill
        
        // ジャンル４

        //x:値減少で左 y:値減少で上
        GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
        // GenreButton4に画像を設定
        GenreButton4.setImage(UIImage(named: "1-4"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton4)
        
        // ジャンル３
        GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
        // GenreButton3に画像を設定
        GenreButton3.setImage(UIImage(named: "1-3"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton3)
        
        // ジャンル２
        GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
        // GenreButton2に画像を設定
        GenreButton2.setImage(UIImage(named: "1-2"), for: UIControl.State())
        // GenreButton2を追加
        self.view.addSubview(GenreButton2)
        
        // ジャンル1
        GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
        // GenreButton1に画像を設定
        GenreButton1.setImage(UIImage(named: "1-13"), for: UIControl.State())
        // GenreButton1を追加
        self.view.addSubview(GenreButton1)
        
        
        // YearButtonを生成
        YearButton.frame = CGRect(x: 30, y: 125, width: 100, height: 100);
        // ShareButtonに画像を設定
        YearButton.setImage(UIImage(named: "article-25"), for: UIControl.State())
        // YearButtonを追加
        self.view.addSubview(YearButton)
        
        // MonthButtonを生成
        MonthButton.frame = CGRect(x: 140, y: 150, width: 70, height: 50);
        // ShareButtonに画像を設定
        MonthButton.setImage(UIImage(named: "article-26"), for: UIControl.State())
        // YearButtonを追加
        self.view.addSubview(MonthButton)
        
        
        //　記事１つ目
        //記事タイトル１
        let titleLabel = UILabel() // ラベルの生成
        titleLabel.frame = CGRect(x: -100, y: 185, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel.text = "恋仲" // 左上のタイトルテキストを入れる場所
        titleLabel.textColor = UIColor.gray // テキストカラーの設定
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(titleLabel) // ラベルの追加
        // ハッシュタグの設定
        let tagLabel11 = UILabel() // ラベルの生成
        tagLabel11.frame = CGRect(x: -130, y: 340, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel11.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel11.text = "#ドラマ" //
        tagLabel11.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel11.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel11) // ラベルの追加
        
        let tagLabel12 = UILabel() // ラベルの生成
        tagLabel12.frame = CGRect(x: -50, y: 340, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel12.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel12.text = "#福士蒼汰" //
        tagLabel12.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel12.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel12) // ラベルの追加
        
        let tagLabel13 = UILabel() // ラベルの生成
        tagLabel13.frame = CGRect(x: -130, y: 360, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel13.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel13.text = "#本田翼" //
        tagLabel13.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel13.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel13) // ラベルの追加
        
        let tagLabel14 = UILabel() // ラベルの生成
        tagLabel14.frame = CGRect(x: -50, y: 360, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel14.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel14.text = "#月曜ドラマ" //
        tagLabel14.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel14.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel14) // ラベルの追加
        
        
        
        
        //記事２つ目
        //記事タイトル2
        let titleLabel2 = UILabel() // ラベルの生成
        titleLabel2.frame = CGRect(x: 100, y: 185, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel2.text = "アンナチュラル" // 右上のタイトルテキストを入れる場所
        titleLabel2.textColor = UIColor.gray // テキストカラーの設定
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(titleLabel2) // ラベルの追加
        
        // ハッシュタグの設定
        let tagLabel21 = UILabel() // ラベルの生成
        tagLabel21.frame = CGRect(x: 60, y: 340, width: UIScreen.main.bounds.size.width, height: 44) //位置とサイズの指定
        tagLabel21.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel21.text = "#ドラマ" //
        tagLabel21.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel21.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel21) // ラベルの追加
            
        let tagLabel22 = UILabel() // ラベルの生成
        tagLabel22.frame = CGRect(x: 140, y: 340, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel22.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel22.text = "#金曜ドラマ" //
        tagLabel22.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel22.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel22) // ラベルの追加
            
        let tagLabel23 = UILabel() // ラベルの生成
        tagLabel23.frame = CGRect(x: 60, y: 360, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel23.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel23.text = "#石原さとみ" //
        tagLabel23.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel23.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel23) // ラベルの追加
            
        let tagLabel24 = UILabel() // ラベルの生成
        tagLabel24.frame = CGRect(x: 140, y: 360, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel24.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel24.text = "#米津玄師" //
        tagLabel24.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel24.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel24) // ラベルの追加
        
        
        
        
        //記事タイトル3
        let titleLabel3 = UILabel() // ラベルの生成
        titleLabel3.frame = CGRect(x: -100, y: 405, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel3.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel3.text = "校閲ガール" // タイトルテキストを入れる場所
        titleLabel3.textColor = UIColor.gray // テキストカラーの設定
        titleLabel3.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(titleLabel3) // ラベルの追加
        // ハッシュタグの設定
        let tagLabel31 = UILabel() // ラベルの生成
        tagLabel31.frame = CGRect(x: -130, y: 570, width: UIScreen.main.bounds.size.width, height: 44) //位置とサイズの指定
        tagLabel31.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel31.text = "#ドラマ" //
        tagLabel31.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel31.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel31) // ラベルの追加
            
        let tagLabel32 = UILabel() // ラベルの生成
        tagLabel32.frame = CGRect(x: -50, y: 570, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel32.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel32.text = "#石原さとみ" //
        tagLabel32.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel32.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel32) // ラベルの追加
            
        let tagLabel33 = UILabel() // ラベルの生成
        tagLabel33.frame = CGRect(x: -130, y: 590, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel33.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel33.text = "#菅田将暉" //
        tagLabel33.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel33.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel33) // ラベルの追加
            
        let tagLabel34 = UILabel() // ラベルの生成
        tagLabel34.frame = CGRect(x: -50, y: 590, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel34.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel34.text = "#水曜ドラマ" //
        tagLabel34.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel34.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel34) // ラベルの追加
        
        
        
        //記事4つ目
        //記事タイトル4
        let titleLabel4 = UILabel() // ラベルの生成
        titleLabel4.frame = CGRect(x: 100, y: 405, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel4.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel4.text = "孤独のグルメ1" // タイトルテキストを入れる場所
        titleLabel4.textColor = UIColor.gray // テキストカラーの設定
        titleLabel4.font = UIFont.boldSystemFont(ofSize: 20) // フォントの設定
        self.view.addSubview(titleLabel4) // ラベルの追加
        
        // ハッシュタグの設定
        let tagLabel41 = UILabel() // ラベルの生成
        tagLabel41.frame = CGRect(x: 60, y: 570, width: UIScreen.main.bounds.size.width, height: 44) //位置とサイズの指定
        tagLabel41.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel41.text = "#ドラマ" //
        tagLabel41.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel41.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel41) // ラベルの追加
            
        let tagLabel42 = UILabel() // ラベルの生成
        tagLabel42.frame = CGRect(x: 140, y: 570, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel42.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel42.text = "#シーズン１" //
        tagLabel42.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel42.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel42) // ラベルの追加
            
        let tagLabel43 = UILabel() // ラベルの生成
        tagLabel43.frame = CGRect(x: 60, y: 590, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel43.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel43.text = "#松重豊" //
        tagLabel43.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel43.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel43) // ラベルの追加
            
        let tagLabel44 = UILabel() // ラベルの生成
        tagLabel44.frame = CGRect(x: 140, y: 590, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        tagLabel44.textAlignment = NSTextAlignment.center // 横揃えの設定
        tagLabel44.text = "#月曜ドラマ" //
        tagLabel44.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        tagLabel44.font = UIFont.systemFont(ofSize: 10) // フォントの設定
        self.view.addSubview(tagLabel44) // ラベルの追加
        
        
        //MARK
        
        // 各ImageViewに画面遷移を追加
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(self.tapped(_:)))
        
        // デリゲートをセット
        tapGesture.delegate = self
        
        self.NewsImage.addGestureRecognizer(tapGesture)
        
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(self.tapped(_:)))
        // デリゲートをセット
        tapGesture2.delegate = self
        
        self.NewsImage2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(self.tapped(_:)))
        // デリゲートをセット
        tapGesture3.delegate = self
        
        self.NewsImage3.addGestureRecognizer(tapGesture3)
        
        let tapGesture4:UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(self.tapped(_:)))
        // デリゲートをセット
        tapGesture4.delegate = self
        
        self.NewsImage4.addGestureRecognizer(tapGesture4)
        
    }
    
    @objc func tapped(_ sender:UITapGestureRecognizer){
        if sender.state == .ended {
            // NewsStoryboardのインスタンス取得
            let storyboard = UIStoryboard(name: "News", bundle: nil)
                    
            // 遷移先NewsViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(identifier: "NewsScreen") as! NewsViewController
            
            // 画面遷移(プッシュ遷移)
            self.navigationController?.pushViewController(nextView, animated: true)
           
            
        }

    
    
    }

}
