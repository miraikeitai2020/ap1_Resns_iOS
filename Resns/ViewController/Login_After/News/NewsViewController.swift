//
//  NewsViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/10/26.
//


import Foundation


import UIKit

class NewsViewController: UIViewController {

    // 各ボタンの宣言
    let ShareButton  = UIButton(type: .custom)
    
    let ListButton  = UIButton(type: .custom)
    
    let GoodButton  = UIButton(type: .custom)
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        /*
        // 記事画像を置くところ
        let NewsImage = UIImageView(image: UIImage())
        NewsImage.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        NewsImage.tintColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.0)
        self.view.addSubview(NewsImage)
        
        let NewsImageView = UIImageView()
        let NewsImageFileurl = "https://"
        
        NewsImageView.image =  UIImage(named: NewsImageFileurl)
        */
        // タイトルの設定
        let titleLabel = UILabel() // ラベルの生成
        titleLabel.frame = CGRect(x: 0, y: 330, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel.text = "タイトル" // テキストの設定
        titleLabel.textColor = UIColor.gray // テキストカラーの設定
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36) // フォントの設定
        self.view.addSubview(titleLabel) // ラベルの追加
        
        
        // ハッシュタグの設定
        let titleLabel1 = UILabel() // ラベルの生成
        titleLabel1.frame = CGRect(x: -80, y: 380, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel1.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel1.text = "＃ハッシュタグ" // テキストの設定
        titleLabel1.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel1.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel1) // ラベルの追加
        
        let titleLabel2 = UILabel() // ラベルの生成
        titleLabel2.frame = CGRect(x: 0, y: 380, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel2.text = "#ハッシュタグ" // テキストの設定
        titleLabel2.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel2.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel2) // ラベルの追加
        
        let titleLabel3 = UILabel() // ラベルの生成
        titleLabel3.frame = CGRect(x: 80, y: 380, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel3.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel3.text = "#ハッシュタグ" // テキストの設定
        titleLabel3.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel3.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel3) // ラベルの追加
        
        
        let titleLabel4 = UILabel() // ラベルの生成
        titleLabel4.frame = CGRect(x: -80, y: 400, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel4.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel4.text = "#ハッシュタグ" // テキストの設定
        titleLabel4.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0)// テキストカラーの設定
        titleLabel4.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel4) // ラベルの追加
        
        
        
        
        
        // ShareButtonにセットする画像の大きさ変更
        ShareButton.imageView?.contentMode = .scaleAspectFit
        ShareButton.contentHorizontalAlignment = .fill
        ShareButton.contentVerticalAlignment = .fill
        
        // ListButtonにセットする画像の大きさ変更
        ListButton.imageView?.contentMode = .scaleAspectFit
        ListButton.contentHorizontalAlignment = .fill
        ListButton.contentVerticalAlignment = .fill
        
        // GoodButtonにセットする画像の大きさ変更
        GoodButton.imageView?.contentMode = .scaleAspectFit
        GoodButton.contentHorizontalAlignment = .fill
        GoodButton.contentVerticalAlignment = .fill
        
        
        // ShareButtonを生成
        ShareButton.frame = CGRect(x: 100, y: 440, width: 50, height: 50);
        // ShareButtonに画像を設定
        ShareButton.setImage(UIImage(named: "グループ 2256"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ShareButton)
        
        // ListButtonを生成
        ListButton.frame = CGRect(x: 195, y: 440, width: 50, height: 50);
        // ListButtonに画像を設定
        ListButton.setImage(UIImage(named: "グループ 2256"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ListButton)
        
        
        // GoodButtonを生成
        GoodButton.frame = CGRect(x: 290, y: 440, width: 50, height: 50);
        // GoodButtonに画像を設定
        GoodButton.setImage(UIImage(named: "グループ 2256"), for: UIControl.State())
        // GoodButtonを追加
        self.view.addSubview(GoodButton)
        
        /*
        // UITextFieldを生成
        let textField = UITextField()
        textField.frame = CGRect(x: 50, y: 550, width: 310, height: 400)
        
        // 枠線のスタイルを設定
        textField.borderStyle = .roundedRect
        
        // UITextFieldを追加
        self.view.addSubview(textField)
        */
        
        // TextView生成する
        let NewsTextView: UITextView = UITextView(frame: CGRect(x: 20, y: 500, width: 370, height: 400))
        // TextViewの背景を白に設定する.
        NewsTextView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        // 角に丸みをつける
        NewsTextView.layer.masksToBounds = true
        // 丸みのサイズを設定する
        NewsTextView.layer.cornerRadius = 20.0
        // 枠線の太さを設定する.
        NewsTextView.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        NewsTextView.layer.borderColor = UIColor.gray.cgColor
        
        // 表示させるテキストを入れる場所
        NewsTextView.text = ""
        
        // 左詰めの設定をする.
        NewsTextView.textAlignment = NSTextAlignment.left
        
        
        // TextViewをViewに追加する.
        self.view.addSubview(NewsTextView)

        
        
    }
    
    
    

    //override func didReceiveMemoryWarning() {
        //super.didReceiveMemoryWarning()
    //}
}
