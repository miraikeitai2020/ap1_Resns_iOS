//
//  GenreSelectViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/10/25.
//


import Foundation


import UIKit

class GenreSelectViewController: UIViewController, UIGestureRecognizerDelegate{
    
    
    
    // ドラマ
    let Drama = UIButton(type: .custom)
    // スポーツ
    let Sports  = UIButton(type: .custom)
    // 音楽
    let Music  = UIButton(type: .custom)
    // グルメ
    let Food  = UIButton(type: .custom)
    // アニメ・漫画
    let Anime = UIButton(type: .custom)
    // ゲーム
    let Game  = UIButton(type: .custom)
    // エンタメ
    let Entertainment  = UIButton(type: .custom)
    // ファッション
    let Fashion = UIButton(type: .custom)
    // 動物
    let Animal = UIButton(type: .custom)
    // 国際
    let International = UIButton(type: .custom)
    // 政治
    let Politics = UIButton(type: .custom)
    // その他
    let Others = UIButton(type: .custom)
    
    
    // 次へボタン
    let Next = UIButton(type: .custom)
    
    // 各ジャンルボタンのON/OFF管理
    var flag1: Bool = false
    var flag2: Bool = false
    var flag3: Bool = false
    var flag4: Bool = false
    var flag5: Bool = false
    var flag6: Bool = false
    var flag7: Bool = false
    var flag8: Bool = false
    var flag9: Bool = false
    var flag10: Bool = false
    var flag11: Bool = false
    var flag12: Bool = false
    
    
    // 選んだジャンルの数を保持する値
    var GenreSelect: Int = 0
    
    // ジャンルの個数を誤った時の警告表示
    var alertController: UIAlertController!
    
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    
    // ロゴ追加
    let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // ロゴ追加の処理
        let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
        iconImage.frame = CGRect(x: 100, y: 100, width: 185, height: 100)
        self.view.addSubview(iconImage)
        
        // 各ボタンにセットする画像の大きさ変更
        Drama.imageView?.contentMode = .scaleAspectFit
        Drama.contentHorizontalAlignment = .fill
        Drama.contentVerticalAlignment = .fill
        
        Sports.imageView?.contentMode = .scaleAspectFit
        Sports.contentHorizontalAlignment = .fill
        Sports.contentVerticalAlignment = .fill
        
        Music.imageView?.contentMode = .scaleAspectFit
        Music.contentHorizontalAlignment = .fill
        Music.contentVerticalAlignment = .fill
        
        Food.imageView?.contentMode = .scaleAspectFit
        Food.contentHorizontalAlignment = .fill
        Food.contentVerticalAlignment = .fill
        
        Anime.imageView?.contentMode = .scaleAspectFit
        Anime.contentHorizontalAlignment = .fill
        Anime.contentVerticalAlignment = .fill
        
        Game.imageView?.contentMode = .scaleAspectFit
        Game.contentHorizontalAlignment = .fill
        Game.contentVerticalAlignment = .fill
        
        Entertainment.imageView?.contentMode = .scaleAspectFit
        Entertainment.contentHorizontalAlignment = .fill
        Entertainment.contentVerticalAlignment = .fill
        
        Fashion.imageView?.contentMode = .scaleAspectFit
        Fashion.contentHorizontalAlignment = .fill
        Fashion.contentVerticalAlignment = .fill
        
        Animal.imageView?.contentMode = .scaleAspectFit
        Animal.contentHorizontalAlignment = .fill
        Animal.contentVerticalAlignment = .fill
        
        International.imageView?.contentMode = .scaleAspectFit
        International.contentHorizontalAlignment = .fill
        International.contentVerticalAlignment = .fill
        
        Politics.imageView?.contentMode = .scaleAspectFit
        Politics.contentHorizontalAlignment = .fill
        Politics.contentVerticalAlignment = .fill
        
        Others.imageView?.contentMode = .scaleAspectFit
        Others.contentHorizontalAlignment = .fill
        Others.contentVerticalAlignment = .fill
        
        Next.imageView?.contentMode = .scaleAspectFit
        Next.contentHorizontalAlignment = .fill
        Next.contentVerticalAlignment = .fill
        
        
        
        let Label1 = UILabel() // ラベルの生成
        Label1.frame = CGRect(x: 0, y: 200, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label1.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label1.text = "あなたの知りたいジャンルを4つ選んでください。" // テキストの設定
        Label1.textColor = UIColor.darkGray // テキストカラーの設定
        Label1.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label1) // ラベルの追加
        
        
        // ドラマ
        Drama.frame = CGRect(x: 40, y: 267.5, width: 80, height: 45);
        // ドラマボタンに画像を設定
        Drama.setImage(UIImage(named: "1"), for: UIControl.State())
        // ドラマボタンを追加
        self.view.addSubview(Drama)
        
        
        // スポーツ
        Sports.frame = CGRect(x: 170, y: 267.5, width: 80, height: 45);
        // スポーツボタンに画像を設定
        Sports.setImage(UIImage(named: "2"), for: UIControl.State())
        // スポーツボタンを追加
        self.view.addSubview(Sports)
        
        
        // 音楽
        Music.frame = CGRect(x: 300, y: 267.5, width: 80, height: 45);
        // 音楽ボタンに画像を設定
        Music.setImage(UIImage(named: "3"), for: UIControl.State())
        // 音楽ボタンを追加
        self.view.addSubview(Music)
        
        
        // グルメ
        Food.frame = CGRect(x: 40, y: 357.5, width: 80, height: 45);
        // グルメボタンに画像を設定
        Food.setImage(UIImage(named: "4"), for: UIControl.State())
        // グルメボタンを追加
        self.view.addSubview(Food)
        
        
        // アニメ・漫画
        Anime.frame = CGRect(x: 170, y: 357.5, width: 80, height: 45);
        // アニメ・漫画ボタンに画像を設定
        Anime.setImage(UIImage(named: "5"), for: UIControl.State())
        // アニメ・漫画ボタンを追加
        self.view.addSubview(Anime)
        
        
        // ゲーム
        Game.frame = CGRect(x: 300, y: 357.5, width: 80, height: 45);
        // ゲームボタンに画像を設定
        Game.setImage(UIImage(named: "6"), for: UIControl.State())
        // ゲームボタンを追加
        self.view.addSubview(Game)
        
        
        // エンタメ
        Entertainment.frame = CGRect(x: 40, y: 447.5, width: 80, height: 45);
        // エンタメボタンに画像を設定
        Entertainment.setImage(UIImage(named: "7"), for: UIControl.State())
        // エンタメボタンを追加
        self.view.addSubview(Entertainment)
        
        
        // ファッション
        Fashion.frame = CGRect(x: 170, y: 447.5, width: 80, height: 45);
        // ファッションボタンに画像を設定
        Fashion.setImage(UIImage(named: "8"), for: UIControl.State())
        // ファッションボタンを追加
        self.view.addSubview(Fashion)
        
        
        // 動物
        Animal.frame = CGRect(x: 300, y: 447.5, width: 80, height: 45);
        // 動物ボタンに画像を設定
        Animal.setImage(UIImage(named: "9"), for: UIControl.State())
        // 動物ボタンを追加
        self.view.addSubview(Animal)
        
        
        // 国際
        International.frame = CGRect(x: 40, y: 537.5, width: 80, height: 45);
        // 国際に画像を設定
        International.setImage(UIImage(named: "10"), for: UIControl.State())
        // 国際を追加
        self.view.addSubview(International)
        
        
        // 政治
        Politics.frame = CGRect(x: 170, y: 537.5, width: 80, height: 45);
        // 政治に画像を設定
        Politics.setImage(UIImage(named: "11"), for: UIControl.State())
        // 政治ボタンを追加
        self.view.addSubview(Politics)
        
        
        // その他
        Others.frame = CGRect(x: 300, y: 537.5, width: 80, height: 45);
        // その他ボタンに画像を設定
        Others.setImage(UIImage(named: "12"), for: UIControl.State())
        // その他ボタンを追加
        self.view.addSubview(Others)
        
        let Label2 = UILabel() // ラベルの生成
        Label2.frame = CGRect(x: 0, y: 605, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        Label2.textAlignment = NSTextAlignment.center // 横揃えの設定
        Label2.text = "選んだジャンルは後から変更できます。" // テキストの設定
        Label2.textColor = UIColor.darkGray// テキストカラーの設定
        Label2.font = UIFont.boldSystemFont(ofSize: 15) // フォントの設定
        self.view.addSubview(Label2) // ラベルの追加
        
        
        
        
        // 次へ
        Next.frame = CGRect(x: 170, y: 660, width: 80, height: 45);
        // 次へボタンに画像を設定
        Next.setImage(UIImage(named: "13"), for: UIControl.State())
        // 次へボタンを追加
        self.view.addSubview(Next)
        
        //　ジャンルを４つ選ぶまで「次に」ボタンを押せないようにする処理
        Next.isEnabled = false
        
        
        //let  buttonArray: [UIButton] = [Drama,Sports,Music,Food,Anime,Game,Entertainment,Fashion,Animal,International,Politics,Others]
        
        
        // 各ジャンルボタン（12個）にタップ時のデリゲートを追加
        // ドラマボタン
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedDrama(_:)))
        
        tapGesture1.delegate = self
        self.Drama.addGestureRecognizer(tapGesture1)
        // スポーツボタン
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedSports(_:)))
        tapGesture2.delegate = self
        self.Sports.addGestureRecognizer(tapGesture2)
        // 音楽ボタン
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedMusic(_:)))
        tapGesture3.delegate = self
        self.Music.addGestureRecognizer(tapGesture3)
        // グルメボタン
        let tapGesture4:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedFood(_:)))
        tapGesture4.delegate = self
        self.Food.addGestureRecognizer(tapGesture4)
        // アニメ・漫画ボタン
        let tapGesture5:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedAnime(_:)))
        tapGesture5.delegate = self
        self.Anime.addGestureRecognizer(tapGesture5)
        // ゲームボタン
        let tapGesture6:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedGame(_:)))
        tapGesture6.delegate = self
        self.Game.addGestureRecognizer(tapGesture6)
        // エンタメボタン
        let tapGesture7:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedEntertainment(_:)))
        tapGesture7.delegate = self
        self.Entertainment.addGestureRecognizer(tapGesture7)
        // ファッションボタン
        let tapGesture8:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedFashion(_:)))
        tapGesture8.delegate = self
        self.Fashion.addGestureRecognizer(tapGesture8)
        // 動物ボタン
        let tapGesture9:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedAnimal(_:)))
        tapGesture9.delegate = self
        self.Animal.addGestureRecognizer(tapGesture9)
        // 国際ボタン
        let tapGesture10:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedInternational(_:)))
        tapGesture10.delegate = self
        self.International.addGestureRecognizer(tapGesture10)
        // 動物ボタン
        let tapGesture11:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedPolitics(_:)))
        tapGesture11.delegate = self
        self.Politics.addGestureRecognizer(tapGesture11)
        // 国際ボタン
        let tapGesture12:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tappedOthers(_:)))
        tapGesture12.delegate = self
        self.Others.addGestureRecognizer(tapGesture12)
        
        
        
        self.Drama.addGestureRecognizer(tapGesture1)
        
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(GenreSelectViewController.tapped(_:)))
        
        tapGesture.delegate = self
        
        self.Next.addGestureRecognizer(tapGesture)
        
        
        // userDefaultsに格納したい値
        let Genre4: [String] = ["ドラマ", "グルメ", "音楽", "政治"]
               // 配列の保存
               userDefaults.set(Genre4, forKey: "Genre4")
               // userDefaultsに保存された値の取得
               let getGenre4:[String] = userDefaults.array(forKey: "Genre4") as! [String]
               print(getGenre4)
      
        //print (GenreSelect)
        /*
        //アラート1生成
        // ジャンルを４つより多く選んでしまった時の処理
        let alert1: UIAlertController = UIAlertController(title: "ジャンルを４つより多くは選べません", message:"", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction1: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //実際の処理
            print("確定")
        })
        
        //UIAlertControllerに確定ボタンをActionを追加
        alert1.addAction(confirmAction1)
        
        //アラート2生成
        // ジャンルを４つより多く選んでしまった時の処理
        let alert2: UIAlertController = UIAlertController(title: "ジャンルを４つ選んでください", message:"", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction2: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //実際の処理
            print("確定")
        })
        
        //UIAlertControllerに確定ボタンをActionを追加
        alert2.addAction(confirmAction2)
        
        
        if GenreSelect == 4 {
        // 「次に」ボタンを押せるようにする処理
        Next.isEnabled = true
        
        } else if GenreSelect >= 5 {
        // アラート１を実際に表示する処理
        present(alert1, animated: true, completion: nil)
        } else {
        //　アラート２を実際に表示する処理
        present(alert2, animated: true, completion: nil)
        }
        */
        
            }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    
    
    
    
    // ジャンルを４個選んだら次へボタンに移動
    
    
    @objc func tappedDrama (_ sender: UITapGestureRecognizer){
       
        if flag1 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag1 = true
            selected()
            print(GenreSelect)
            // ドラマのボタン
            Drama.setImage(UIImage(named: "ドラマ"), for: UIControl.State())
        } else {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag1 = false
            print(GenreSelect)
            Drama.setImage(UIImage(named: "1"), for: UIControl.State())
        }
    }
    
    @objc func tappedSports (_ sender: UITapGestureRecognizer){
        if flag2 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag2 = true
            selected()
            print(GenreSelect)
            Sports.setImage(UIImage(named: "スポーツ"), for: UIControl.State())
        } else if flag2 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag2 = false
            print(GenreSelect)
            Sports.setImage(UIImage(named: "2"), for: UIControl.State())
        }
    }
    
    @objc func tappedMusic (_ sender: UITapGestureRecognizer){
        if flag3 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag3 = true
            selected()
            print(GenreSelect)
            Music.setImage(UIImage(named: "音楽"), for: UIControl.State())
        } else if flag3 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag3 = false
            print(GenreSelect)
            Music.setImage(UIImage(named: "3"), for: UIControl.State())
        }
    }
    
    @objc func tappedFood (_ sender: UITapGestureRecognizer){
        if flag4 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag4 = true
            selected()
            print(GenreSelect)
            Food.setImage(UIImage(named: "グルメ"), for: UIControl.State())
        } else if flag4 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag4 = false
            print(GenreSelect)
            Food.setImage(UIImage(named: "4"), for: UIControl.State())
        }
    }
    
    @objc func tappedAnime (_ sender: UITapGestureRecognizer){
        if flag5 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag5 = true
            selected()
            print(GenreSelect)
           Anime.setImage(UIImage(named: "アニメ・漫画"), for: UIControl.State())
        } else if flag5 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag5 = false
            print(GenreSelect)
            Anime.setImage(UIImage(named: "5"), for: UIControl.State())
        }
    }
    
    @objc func tappedGame (_ sender: UITapGestureRecognizer){
        if flag6 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag6 = true
            selected()
            print(GenreSelect)
            Game.setImage(UIImage(named: "ゲーム"), for: UIControl.State())
        } else if flag6 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag6 = false
            print(GenreSelect)
            Game.setImage(UIImage(named: "6"), for: UIControl.State())
        }
    }
    
    @objc func tappedEntertainment (_ sender: UITapGestureRecognizer){
        if flag7 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag7 = true
            selected()
            print(GenreSelect)
            Entertainment.setImage(UIImage(named: "エンタメ"), for: UIControl.State())
        } else if flag7 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag7 = false
            print(GenreSelect)
            Entertainment.setImage(UIImage(named: "7"), for: UIControl.State())
        }
    }
    
    @objc func tappedFashion (_ sender: UITapGestureRecognizer){
        if flag8 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag8 = true
            selected()
            print(GenreSelect)
            Fashion.setImage(UIImage(named: "ファッション"), for: UIControl.State())
        } else if flag8 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag8 = false
            print(GenreSelect)
            Fashion.setImage(UIImage(named: "8"), for: UIControl.State())
        }
    }
    
    @objc func tappedAnimal (_ sender: UITapGestureRecognizer){
        if flag9 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag9 = true
            selected()
            print(GenreSelect)
            Animal.setImage(UIImage(named: "アニマル"), for: UIControl.State())
        } else if flag9 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag9 = false
            print(GenreSelect)
            Animal.setImage(UIImage(named: "9"), for: UIControl.State())
        }
    }
    
    @objc func tappedInternational (_ sender: UITapGestureRecognizer){
        if flag10 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag10 = true
            selected()
            print(GenreSelect)
            International.setImage(UIImage(named: "国際"), for: UIControl.State())
        } else if flag10 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag10 = false
            print(GenreSelect)
            International.setImage(UIImage(named: "10"), for: UIControl.State())
        }
    }
    
    @objc func tappedPolitics (_ sender: UITapGestureRecognizer){
        if flag11 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag11 = true
            selected()
            print(GenreSelect)
            Politics.setImage(UIImage(named: "政治"), for: UIControl.State())
        } else if flag11 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag11 = false
            print(GenreSelect)
            Politics.setImage(UIImage(named: "11"), for: UIControl.State())
        }
    }
    
    @objc func tappedOthers (_ sender: UITapGestureRecognizer){
        if flag12 == false {
            //選択時に走らせたい処理
            GenreSelect += 1
            flag12 = true
            selected()
            print(GenreSelect)
            Others.setImage(UIImage(named: "その他"), for: UIControl.State())
        } else if flag12 == true {
            //取り消す時に走らせたい処理
            GenreSelect -= 1
            flag12 = false
            print(GenreSelect)
            Others.setImage(UIImage(named: "12"), for: UIControl.State())
        }
    }
    
    // 「次に」ボタンを押したら性別選択画面に遷移する処理
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            
            // SexualStoryboardのインスタンス取得
            let storyboard = UIStoryboard(name: "Sexual", bundle: nil)
            
            // 遷移先SexualViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(identifier: "SexualScreen") as! SexualViewController
            
            // 画面遷移(プッシュ遷移)
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    
    func selected() {
        if GenreSelect == 4 {
        // 「次に」ボタンを押せるようにする処理
        Next.isEnabled = true
        
        } else if GenreSelect >= 5 {
            // 「次に」ボタンを押せなくするにする処理
            Next.isEnabled = false
            // ジャンルを４つより多く選んでしまった時の処理
            let alert1: UIAlertController = UIAlertController(title: "ジャンルを４つより多くは選べません", message:"", preferredStyle:  UIAlertController.Style.alert)
            // 確定ボタンの処理
            let confirmAction1: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
                // 確定ボタンが押された時の処理をクロージャ実装する
                (action: UIAlertAction!) -> Void in
                //実際の処理
                print("確定")
            })
            //UIAlertControllerに確定ボタンをActionを追加
            alert1.addAction(confirmAction1)
        // アラート１を実際に表示する処理
        present(alert1, animated: true, completion: nil)
        }
        
        /*
        else {
            //アラート2生成
            // ジャンルを４つより多く選んでしまった時の処理
            let alert2: UIAlertController = UIAlertController(title: "ジャンルを４つ選んでください", message:"", preferredStyle:  UIAlertController.Style.alert)
            // 確定ボタンの処理
            let confirmAction2: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
                // 確定ボタンが押された時の処理をクロージャ実装する
                (action: UIAlertAction!) -> Void in
                //実際の処理
                print("確定")
            })
            //UIAlertControllerに確定ボタンをActionを追加
            alert2.addAction(confirmAction2)
        //　アラート２を実際に表示する処理
        present(alert2, animated: true, completion: nil)
        }
        */
    }
    
    /*
    if GenreSelect == 4 {
    // 「次に」ボタンを押せるようにする処理
    Next.isEnabled = true
    
    } else if GenreSelect >= 5 {
    // アラート１を実際に表示する処理
    present(alert1, animated: true, completion: nil)
    } else {
    //　アラート２を実際に表示する処理
    present(alert2, animated: true, completion: nil)
    }
 */
}
