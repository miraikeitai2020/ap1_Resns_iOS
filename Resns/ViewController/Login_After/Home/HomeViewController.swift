//
//  HomeViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//


import Foundation

import UIKit

// スワイプ毎の上のジャンルボタンの管理
var flag1 = 1
var flag2 = 0
var flag3 = 0
var flag4 = 0

var Number = 0

var IDnumbers: [String] = []
var IDnumbers2: [String] = []
var IDnumbers3: [String] = []
var IDnumbers4: [String] = []

var SaveTitle: [String] = []
var SaveTag: [String] = []
var SaveTag2: [String] = []
var SaveTag3: [String] = []
var SaveTag4: [String] = []
var SaveURL: [String] = []



var cell = UICollectionView()

class HomeViewController: UIViewController,UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextFieldDelegate{
    
    let homePresenter = HomePresenter()
 
    var range : Int!
    var n : Int!
    var start = 0

   // let cell = collectionView(withReuseIdentifier: "NewsCollectionViewCell")
    //記事タイトルの設定
    // 非同期のグループ
    let dispatchGroup = DispatchGroup()
    // 並列で実行
    let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
    
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var collectionView: UICollectionView!
    
    // ジャンルButtonを生成
    // ジャンル１
    let GenreButton1 = UIButton(type: .custom)
    // ジャンル2
    let GenreButton2 = UIButton(type: .custom)
    // ジャンル3
    let GenreButton3 = UIButton(type: .custom)
    // ジャンル4
    let GenreButton4 = UIButton(type: .custom)
    // 年代
    let YearButton = UIButton(type: .custom)
    // 月
    let MonthButton = UIButton(type: .custom)
    
    //var articlesNice: Int!
    var articles: [[ArticlesQuery.Data.Article.Article?]?] = []
    // ロゴ追加
    let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
    
    // 文字列保存用の変数
    var yearTextFieldString = ""
    var monthTextFieldString = ""
    
    
    let yearTextField = UITextField()
    
    let monthTextField = UITextField()
    
    // 年代検索用のツールバー生成
    let yearToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let monthToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    //  userDefaultsの定義
    var yearUserDefaults = UserDefaults.standard
    var monthUserDefaults = UserDefaults.standard
    
    var i = 0
    var i2 = 0
    var i3 = 0
    var i4 = 0
    
    var counting = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        // 記事を開いたときにでるbackボタンの文字を「戻る」に変更する処理
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: nil, action: nil)
       
        //ナビゲーションアイテムのタイトルに画像を設定する
        
        // 背景を灰色に
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        //各ジャンルボタンにセットする画像の大きさを変更する処理
        genreButtonChanged()
        
        // ジャンル1（アニメ・漫画）
        GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
        // GenreButton1に画像を設定
        GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
        // GenreButton1を追加
        self.view.addSubview(GenreButton1)
        
        // ジャンル３（エンタメ）
        GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
        // GenreButton3に画像を設定
        GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton3)
        
        // ジャンル２（ドラマ）
        GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
        // GenreButton2に画像を設定
        GenreButton2.setImage(UIImage(named: "1-1"), for: UIControl.State())
        // GenreButton2を追加
        self.view.addSubview(GenreButton2)
        
        // ジャンル３（エンタメ）
        GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
        // GenreButton3に画像を設定
        GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton3)
        
        // ジャンル４（音楽）
        //x:値減少で左 y:値減少で上
        GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
        // GenreButton4に画像を設定
        GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton4)
        
        // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
        coverViewAdd()
        
        // UITextFieldを生成（年代を入力）
        //let yearTextField = UITextField()
        yearTextField.frame = CGRect(x: 30, y: 160, width: 100, height: 30)
        // プレースホルダを設定
        yearTextField.placeholder = "━━ 年"
        // キーボードタイプを指定
        yearTextField.keyboardType = .asciiCapableNumberPad
        // 枠線のスタイルを設定
        yearTextField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        yearTextField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        yearTextField.clearButtonMode = .always
        // 年代入力後に押すdoneキーの作成
        let yearSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let yearCommitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(yearCommitButtonTapped))
        yearToolBar.items = [yearSpace, yearCommitButton]
        yearToolBar.sizeToFit()
        self.yearTextField.inputAccessoryView = yearToolBar
        // UITextFieldを追加
        self.view.addSubview(yearTextField)
        // デリゲートを指定
        yearTextField.delegate = self
        
        
        // UITextFieldを生成（月を入力）
        monthTextField.frame = CGRect(x: 140, y: 160, width: 100, height: 30)
        // プレースホルダを設定
        monthTextField.placeholder = "━━ 月"
        // キーボードタイプを指定
        monthTextField.keyboardType = .asciiCapableNumberPad
        // 枠線のスタイルを設定
        monthTextField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        monthTextField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        monthTextField.clearButtonMode = .always
        // 年代入力後に押すdoneキーの作成
        let monthSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let monthCommitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(monthCommitButtonTapped))
        monthToolBar.items = [monthSpace, monthCommitButton]
        monthToolBar.sizeToFit()
        self.monthTextField.inputAccessoryView = monthToolBar
        // UITextFieldを追加
        self.view.addSubview(monthTextField)
        // デリゲートを指定
        monthTextField.delegate = self
       
        // xib関係の処理
        collectionView.delegate = self
        //collectionView.delegate = self
        collectionView.dataSource = self
        
       
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        //layout.itemSize = CGSize(width:, height: 242)
        collectionView.collectionViewLayout = layout
        view.addSubview(collectionView)
        //self.view.bringSubviewToFront(collectionView)
        
        
        // ジャンルボタンを選択した時のデリゲートを追加
        // ジャンルボタン１は今記事を見ているジャンルなので必要なし
        /*
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(HomeViewController.tappedGenreButton1(_:)))
        tapGesture1.delegate = self
        self.GenreButton1.addGestureRecognizer(tapGesture1)
        */
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(HomeViewController.tappedGenreButton2(_:)))
        tapGesture2.delegate = self
        self.GenreButton2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(HomeViewController.tappedGenreButton3(_:)))
        tapGesture3.delegate = self
        self.GenreButton3.addGestureRecognizer(tapGesture3)
     
        let tapGesture4:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(HomeViewController.tappedGenreButton4(_:)))
        tapGesture4.delegate = self
        self.GenreButton4.addGestureRecognizer(tapGesture4)
        
   
       
    }
    
    // 各ジャンルボタンにセットする画像の大きさを変更
    func genreButtonChanged(){
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
        
    }
    
    // YearTextField・MonthButtonボタンをそれぞれ生成するメソッド
    func YearMonthTextFieldadd(){
        // UITextFieldを生成（年代を入力）
        //let yearTextField = UITextField()
        yearTextField.frame = CGRect(x: 30, y: 160, width: 100, height: 30)
        // プレースホルダを設定
        yearTextField.placeholder = "━━ 年"
        // キーボードタイプを指定
        yearTextField.keyboardType = .asciiCapableNumberPad
        // 枠線のスタイルを設定
        yearTextField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        yearTextField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        yearTextField.clearButtonMode = .always
        // 年代入力後に押すdoneキーの作成
        let yearSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let yearCommitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(yearCommitButtonTapped))
        yearToolBar.items = [yearSpace, yearCommitButton]
        yearToolBar.sizeToFit()
        self.yearTextField.inputAccessoryView = yearToolBar
        // UITextFieldを追加
        self.view.addSubview(yearTextField)
        // デリゲートを指定
        yearTextField.delegate = self
        
        
        // UITextFieldを生成（月を入力）
        monthTextField.frame = CGRect(x: 140, y: 160, width: 100, height: 30)
        // プレースホルダを設定
        monthTextField.placeholder = "━━ 月"
        // キーボードタイプを指定
        monthTextField.keyboardType = .asciiCapableNumberPad
        // 枠線のスタイルを設定
        monthTextField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        monthTextField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        monthTextField.clearButtonMode = .always
        // 年代入力後に押すdoneキーの作成
        let monthSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let monthCommitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(monthCommitButtonTapped))
        monthToolBar.items = [monthSpace, monthCommitButton]
        monthToolBar.sizeToFit()
        self.monthTextField.inputAccessoryView = monthToolBar
        // UITextFieldを追加
        self.view.addSubview(monthTextField)
        // デリゲートを指定
        monthTextField.delegate = self
        
    }
    
    
    // ジャンルボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを作成するメソッド
    func coverViewAdd(){
        // ジャンルボタンより上
        let coverViewOn = UIView.init(frame: CGRect.init(x: 0, y: 45, width: 450, height: 57))
        coverViewOn.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        //coverViewOn.backgroundColor = UIColor.blue
        self.view.addSubview(coverViewOn)
        // ジャンルボタンより下
        let coverViewUnder = UIView.init(frame: CGRect.init(x: 0, y: 155, width: 450, height: 50))
        coverViewUnder.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        //coverView.backgroundColor = UIColor.blue
        self.view.addSubview(coverViewUnder)
        
    }
    
    // 年代検索時にdoneキーが押された時の処理（年）
    @objc func yearCommitButtonTapped() ->  Bool {
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        self.i = 0
        self.counting = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        //検索結果が0件だった場合エラーを吐く
        yearTextFieldString = yearTextField.text!
        
        let yearTextFieldString:Int? = Int(yearTextField.text!)
        var yearText = yearTextField.text!
        UserDefaults.standard.set(yearTextFieldString, forKey: "year")
        
        // enterを押したらキーパッドが消える
        //yearTextField.resignFirstResponder()
        print(yearTextFieldString as Any)
    
        self.collectionView.reloadData()
        self.view.endEditing(true)
        return true
    }
    // 年代検索時にdoneキーが押された時の処理（月）
    @objc func monthCommitButtonTapped() ->  Bool {
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        self.i = 0
        self.counting = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        //検索結果が0件だった場合エラーを吐く
        
        monthTextFieldString = monthTextField.text!
      
        let monthTextFieldString:Int? = Int(monthTextField.text!)
        var monthText = monthTextField.text!
        UserDefaults.standard.set(monthTextFieldString, forKey: "month")

        print(monthTextFieldString as Any)
    
        // enterを押したらキーパッドが消える
        monthTextField.resignFirstResponder()
        self.collectionView.reloadData()
        self.view.endEditing(true)
    
        return true
    }
    
   
    
    @objc func tappedGenreButton2(_ sender: UITapGestureRecognizer){
        
        self.i = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        if flag1 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-13"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles2()
            self.collectionView.reloadData()
            
            flag1 = 0
            flag2 = 1
            
        } else if flag2 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-19"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles3()
            self.collectionView.reloadData()
            
            flag2 = 0
            flag3 = 1
            
        } else if flag3 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-15"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles4()
            self.collectionView.reloadData()
            
            flag3 = 0
            flag4 = 1
            
        } else if flag4 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles()
            //Home3ViewController()
            self.collectionView.reloadData()
            
            flag4 = 0
            flag1 = 1
            
        }
    }
    
    @objc func tappedGenreButton3(_ sender: UITapGestureRecognizer){
        
        self.i = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        if flag1 == 1{
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-19"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles3()
            self.collectionView.reloadData()
            
            flag1 = 0
            flag3 = 1
            
        } else if flag2 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-15"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles4()
            self.collectionView.reloadData()
            
            flag2 = 0
            flag4 = 1

        } else if flag3 == 1{
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles()
            self.collectionView.reloadData()
            
            flag3 = 0
            flag1 = 1
        } else if flag4 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-13"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles2()
            self.collectionView.reloadData()
            
            flag4 = 0
            flag2 = 1
        }
       
    }
    
    @objc func tappedGenreButton4(_ sender: UITapGestureRecognizer){
        
        self.i = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        if flag1 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-15"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles4()
            self.collectionView.reloadData()
            
            flag1 = 0
            flag4 = 1
            
            
        } else if flag2 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles()
            self.collectionView.reloadData()
            
            flag2 = 0
            flag1 = 1
            
        } else if flag3 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-13"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles2()
            self.collectionView.reloadData()
            
            flag3 = 0
            flag2 = 1
            
            
        } else if flag4 == 1{
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-19"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ボタン画像の大きすぎる当たり判定を隠すためのハリボテviewを表示する処理
            coverViewAdd()
            
            // YearButton・MonthButtonボタンをそれぞれ表示する処理
            YearMonthTextFieldadd()
            
            //reloadArticles3()
            self.collectionView.reloadData()
            
            flag4 = 0
            flag3 = 1
            
        }
       
    }
    
    // yearTextFieldに入力された年代を保存
    func textFieldShouldReturn(_ yearTextField: UITextField) -> Bool {
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        self.i = 0
        self.counting = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        //検索結果が0件だった場合エラーを吐く
        
        yearTextFieldString = yearTextField.text!
        print(yearTextFieldString)
      
        let yearTextFieldString:Int? = Int(yearTextField.text!)
        var yearText = yearTextField.text!
        UserDefaults.standard.set(yearTextFieldString, forKey: "year")
        
        // enterを押したらキーパッドが消える
        yearTextField.resignFirstResponder()
        
        self.collectionView.reloadData()
        return true
        
    }
    
    // yearTextFieldに入力された年代を保存
    func textFieldShouldReturn2(_ monthTextField: UITextField) -> Bool {
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        self.i = 0
        self.counting = 0
        
        start = 0
        IDnumbers = []
        SaveTitle = []
        SaveTag = []
        SaveTag2 = []
        SaveTag3 = []
        SaveTag4 = []
        SaveURL = []
        
        //検索結果が0件だった場合エラーを吐く
        
        monthTextFieldString = monthTextField.text!
      
        let monthTextFieldString:Int? = Int(monthTextField.text!)
        var monthText = monthTextField.text!
        UserDefaults.standard.set(monthTextFieldString, forKey: "month")
        
        
        print(monthTextFieldString as Any)
    
        // enterを押したらキーパッドが消える
        monthTextField.resignFirstResponder()
        self.collectionView.reloadData()
        
        return true
        
    }
}


extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let semaphore = DispatchSemaphore(value: 0)
        
        if flag1 == 1 {
            //キー
            UserDefaults.standard.set("アニメ・漫画", forKey: "genre")
        } else if flag2 == 1 {
            //キー
            UserDefaults.standard.set("ドラマ", forKey: "genre")
        } else if flag3 == 1 {
            //キー
            UserDefaults.standard.set("エンタメ", forKey: "genre")
        } else if flag4 == 1 {
            //キー
            UserDefaults.standard.set("音楽", forKey: "genre")
        }
            
         
            self.homePresenter.application(completion: { [weak self] articlesArticles in
                
                guard let self = self else { return }
                
                self.articles = articlesArticles
                
                guard let unwrapped = self.articles[0]?.count else { return }
                self.counting = unwrapped
    
                
                
                while self.counting > self.i  {
                    //記事IDを全取得
                    guard let NewIDnumbers = self.articles[0]?[self.i]?.id else { return }
                    IDnumbers.append("\(NewIDnumbers)")
                    print(NewIDnumbers)
                    
                    guard let savetitle = self.articles[0]?[self.i]?.title else { return }
                    SaveTitle.append("\(savetitle)")
                    
                    //タグを全取得
                    guard let savetag = self.articles[0]?[self.i]?.tags?[0] else { return }
                    SaveTag.append("\("#"+savetag)")
                    guard let savetag2 = self.articles[0]?[self.i]?.tags?[1] else { return }
                    SaveTag2.append("\("#"+savetag2)")
                    guard let savetag3 = self.articles[0]?[self.i]?.tags?[2] else { return }
                    SaveTag3.append("\("#"+savetag3)")
                    guard let savetag4 = self.articles[0]?[self.i]?.tags?[3] else { return }
                    SaveTag4.append("\("#"+savetag4)")
                    
                    guard let saveurl = self.articles[0]?[self.i]?.imagePath else { return }
                    SaveURL.append("\(saveurl)")
                    
                    self.i = self.i + 1
                }
                
                if self.i < 20 && self.counting <= self.i{
                    IDnumbers.append("")
                    SaveTitle.append("")
                    SaveTag.append("")
                    SaveTag2.append("")
                    SaveTag3.append("")
                    SaveTag4.append("")
                    SaveURL.append("a")
                    self.i = self.i + 1
                }
            })
        
        
        if(self.start == 0){
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                
                    //記事タイトルの設定
                    cell.titleLabel.text = SaveTitle[indexPath.row]
                    //記事ハッシュタグの設定
                    cell.tagButton1.setTitle((SaveTag[indexPath.row]), for: .normal)
                    cell.tagButton2.setTitle((SaveTag2[indexPath.row]), for: .normal)
                    cell.tagButton3.setTitle((SaveTag3[indexPath.row]), for: .normal)
                    cell.tagButton4.setTitle((SaveTag4[indexPath.row]), for: .normal)
                        
                    let url = URL(string: (SaveURL[indexPath.row]))!
                
                    do {
                        let data = try Data(contentsOf: url)
                        cell.newsImage.image = UIImage(data: data)
                    } catch let err {
                        //画像がない場合デフォルトURLセット
                        cell.newsImage.image = UIImage(named: "White")
                    }
                self.start = 1
            }
        } else {
            //記事タイトルの設定
            cell.titleLabel.text = SaveTitle[indexPath.row]
            //記事ハッシュタグの設定
            cell.tagButton1.setTitle((SaveTag[indexPath.row]), for: .normal)
            cell.tagButton2.setTitle((SaveTag2[indexPath.row]), for: .normal)
            cell.tagButton3.setTitle((SaveTag3[indexPath.row]), for: .normal)
            cell.tagButton4.setTitle((SaveTag4[indexPath.row]), for: .normal)
            //記事画像の設定
                
            let url = URL(string: (SaveURL[indexPath.row]))!
        
            do {
                let data = try Data(contentsOf: url)
                cell.newsImage.image = UIImage(data: data)
            } catch let err {
                //画像がない場合デフォルトURLセット
                cell.newsImage.image = UIImage(named: "White")
            }
        }
                
        cell.newsCollectionViewDelegate = self
        return cell
}
}

extension HomeViewController:UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        var eachIDnumber = IDnumbers[indexPath.row]
        UserDefaults.standard.set(eachIDnumber, forKey: "newsNumber")
            
        self.performSegue(withIdentifier: "toNews3ViewController", sender: nil)
        
    }
}

extension HomeViewController: NewsCollectionViewDelegate {
    //タグをタップした後の処理メソッド
    func addButtonTaped(_ sender: UIButton) {
        
        let Word = sender.titleLabel?.text
        guard let searchWord = Word else { return }
        
        let searchTags = searchWord.dropFirst(1)
        UserDefaults.standard.set(searchTags, forKey: "Search")
        print(searchTags)
        
        //表示
        //self.present(next, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "toSearchViewController", sender: nil)
        
    }
}

