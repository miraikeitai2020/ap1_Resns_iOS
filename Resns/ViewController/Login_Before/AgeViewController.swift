//
//  AgeViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/10/31.
//

import Foundation

import UIKit

class AgeViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    
    // 決定ボタン
    let Decide = UIButton(type: .custom)
    
    // 年代を入力する枠の作成
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    
    // ロゴ追加
    let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        // 背景を灰色に変更
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // ロゴ追加の処理
        let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
        iconImage.frame = CGRect(x: 100, y: 100, width: 185, height: 100)
        self.view.addSubview(iconImage)
        
        // 各ボタンにセットする画像の大きさ変更
        
        Decide.imageView?.contentMode = .scaleAspectFit
        Decide.contentHorizontalAlignment = .fill
        Decide.contentVerticalAlignment = .fill
        
        let Label1 = UILabel() // ラベルの生成
        Label1.frame = CGRect(x: 0, y: 200, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label1.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label1.text = "プロフィール設定" // テキストの設定
        Label1.textColor = UIColor.darkGray // テキストカラーの設定
        Label1.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label1) // ラベルの追加
        
        let Label2 = UILabel() // ラベルの生成
        Label2.frame = CGRect(x: 0, y: 290, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label2.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label2.text = "生年月日を入力" // テキストの設定
        Label2.textColor = UIColor.darkGray // テキストカラーの設定
        Label2.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label2) // ラベルの追加
        /*
        let Label3 = UILabel() // ラベルの生成
        Label3.frame = CGRect(x: 0, y: 380, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label3.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label3.text = "生年月日は後から変更できません" // テキストの設定
        Label3.textColor = UIColor.red // テキストカラーの設定
        Label3.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label3) // ラベルの追加
        */
        let textImage = UIImageView(image: UIImage(named: "プロフィール年代-生年月日は〜"))
        textImage.frame = CGRect(x: 100, y: 380, width: 210, height: 20)
        self.view.addSubview(textImage)
        
        
        /*
         // TextView生成する
         let NewsTextView: UITextView = UITextView(frame: CGRect(x: 78, y: 50, width: 375, height: 500))
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
         // TextViewをViewに追加する.
         self.view.addSubview(NewsTextView)
         */
        
        // 年代を入力する枠の作成
        //let textField1 = UITextField()
        textField1.frame = CGRect(x: 80, y: 470, width: 76, height: 41)
        // 中央詰めの設定をする.
        textField1.textAlignment = NSTextAlignment.center
        // プレースホルダを設定
        textField1.placeholder = "0000"
        // キーボードタイプを指定
        textField1.keyboardType = .numberPad
        // 枠線のスタイルを設定
        textField1.borderStyle = .roundedRect
        // 角に丸みをつける
        textField1.layer.masksToBounds = true
        // 丸みのサイズを設定する
        textField1.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        textField1.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        textField1.layer.borderColor = UIColor.gray.cgColor
        // UITextFieldを追加
        self.view.addSubview(textField1)
        // デリゲートを指定
        textField1.delegate = self
        
        let Label4 = UILabel() // ラベルの生成
        Label4.frame = CGRect(x: -40, y: 480, width:UIScreen.main.bounds.size.width ,height: 41) // 位置とサイズの指定
        Label4.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label4.text = "年" // テキストの設定
        Label4.textColor = UIColor.darkGray// テキストカラーの設定
        Label4.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label4) // ラベルの追加
        
        // 月を入力する枠の作成
        //let textField2 = UITextField()
        textField2.frame = CGRect(x: 190, y: 470, width: 44, height: 41)
        // 中央詰めの設定をする.
        textField2.textAlignment = NSTextAlignment.center
        // プレースホルダを設定
        textField2.placeholder = "00"
        // キーボードタイプを指定
        textField2.keyboardType = .numberPad
        // 枠線のスタイルを設定
        textField2.borderStyle = .roundedRect
        // 角に丸みをつける
        textField2.layer.masksToBounds = true
        // 丸みのサイズを設定する
        textField2.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        textField2.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        textField2.layer.borderColor = UIColor.gray.cgColor
        // UITextFieldを追加
        self.view.addSubview(textField2)
        // デリゲートを指定
        textField2.delegate = self
        
        let Label5 = UILabel() // ラベルの生成
        Label5.frame = CGRect(x: 35, y: 480, width:UIScreen.main.bounds.size.width ,height: 41) // 位置とサイズの指定
        Label5.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label5.text = "月" // テキストの設定
        Label5.textColor = UIColor.darkGray // テキストカラーの設定
        Label5.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label5) // ラベルの追加
        
        // 日を入力する枠の作成
        //let textField3 = UITextField()
        textField3.frame = CGRect(x: 255, y: 470, width: 44, height: 41)
        // 中央詰めの設定をする.
        textField3.textAlignment = NSTextAlignment.center
        // プレースホルダを設定
        textField3.placeholder = "00"
        // キーボードタイプを指定
        textField3.keyboardType = .numberPad
        // 枠線のスタイルを設定
        textField3.borderStyle = .roundedRect
        // 角に丸みをつける
        textField3.layer.masksToBounds = true
        // 丸みのサイズを設定する
        textField3.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        textField3.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        textField3.layer.borderColor = UIColor.gray.cgColor
        // UITextFieldを追加
        self.view.addSubview(textField3)
        // デリゲートを指定
        textField3.delegate = self
        
        let Label6 = UILabel() // ラベルの生成
        Label6.frame = CGRect(x: 100, y: 480, width:UIScreen.main.bounds.size.width ,height: 41) // 位置とサイズの指定
        Label6.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label6.text = "日" // テキストの設定
        Label6.textColor = UIColor.darkGray // テキストカラーの設定
        Label6.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label6) // ラベルの追加
        
        // 決定
        Decide.frame = CGRect(x: 170, y: 550, width: 80, height: 45);
        // 決定ボタンに画像を設定
        Decide.setImage(UIImage(named: "プロフィール年代-決定"), for: UIControl.State())
        // 決定ボタンを追加
        self.view.addSubview(Decide)
        Decide.isEnabled = false
        
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(AgeViewController.tapped(_:)))
        
        tapGesture.delegate = self
        
        self.Decide.addGestureRecognizer(tapGesture)
        //　年代を入力するまで「決定」ボタンを押せないようにする処理
        //Decide.isEnabled = false
        
        
    }
    func isValid() -> Bool{
        guard let textField1 = textField1.text else {
            return false
        }
        guard let textField2 = textField2.text else {
            return false
        }
        guard let textField3 = textField3.text else {
            return false
        }
        
        if textField1.isEmpty {
            return false
        }
        
        if textField2.isEmpty {
            return false
        }
        
        if textField3.isEmpty {
            return false
        }
        
        return true
    }
    
    // 「決定」ボタンを押したら年代選択画面に遷移する処理
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            // textField1に入力された年代を保存
            let text1 = textField1.text!
            let defaults = UserDefaults.standard
            defaults.set(text1, forKey: "text1")
            let gettext1:Int = userDefaults.integer(forKey: "text1")
            print(gettext1)
            
            // textField2に入力された月を保存
            let text2 = textField2.text!
            defaults.set(text2, forKey: "text2")
            let gettext2:Int = userDefaults.integer(forKey: "text2")
            print(gettext2)
            
            // textField3に入力された日を保存
            let text3 = textField3.text!
            defaults.set(text3, forKey: "text3")
            let gettext3:Int = userDefaults.integer(forKey: "text3")
            print(gettext3)
            
            
            // ProfileCheckSelectViewControllerのインスタンス取得
            let storyboard = UIStoryboard(name: "ProfileCheckSelect", bundle: nil)
            
            // 遷移先ProfileCheckSelectViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(identifier: "ProfileCheckSelectScreen") as! ProfileCheckSelectViewController
            
            // 画面遷移(プッシュ遷移)
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValid() {
            Decide.isEnabled = true
        } else {
            Decide.isEnabled = false
        }
        return true
    }
    
    
    
}
