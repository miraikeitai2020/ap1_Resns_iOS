//
//  HomeViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//


import Foundation

import UIKit

class HomeViewController: UIViewController ,UIGestureRecognizerDelegate,UIScrollViewDelegate{
    
    
    
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
    
    // スワイプ毎の上のジャンルボタンの管理
    var flag1: Bool = true
    var flag2: Bool = false
    var flag3: Bool = false
    var flag4: Bool = false
    
    var models = Model.createModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        // xib関係の処理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 242)
        //layout.itemSize = CGSize(width:, height: 242)
        collectionView.collectionViewLayout = layout
        view.addSubview(collectionView)
        
        //presenter処理
        let homePresenter = HomePresenter()
        //循環参照防止のweakself
        homePresenter.application(completion: { [weak self] articleInfo in
            
            guard let self = self else { return }
            
            
            
        })
        //ナビゲーションアイテムのタイトルに画像を設定する
        let imageView = UIImageView(image:UIImage(named:"rogo_katto"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        // 背景を灰色に
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // 戻るボタンを削除する処理
        self.navigationItem.hidesBackButton = true
        
        //各ジャンルボタンにセットする画像の大きさを変更
        genreButtonChanged()
        
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
        
        // 左スワイプのインスタンス
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_:)))
        leftSwipeGesture.direction = .left
        view.addGestureRecognizer(leftSwipeGesture)
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
    
    @objc func swiped(_ sender: UISwipeGestureRecognizer){
        genreButtonChanged()
        if flag1 == true {
            print("ボボボーボ・ボーボボ")
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-4"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-14"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            flag1 = false
            flag2 = true
        } else if flag2 == true {
            print("ボーボボだ")
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-2"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-4"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-15"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            flag2 = false
            flag3 = true
        } else if flag3 == true {
            print("ボボボーボボーボボが")
            // ジャンル４
            //x:値減少で左 y:値減少で上
            GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
            // GenreButton4に画像を設定
            GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-2"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton3)
            
            // ジャンル２
            GenreButton2.frame = CGRect(x: 115, y: 85, width: 90, height: 73);
            // GenreButton2に画像を設定
            GenreButton2.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-16"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            flag3 = false
            flag4 = true
        } else if flag4 == true {
            print("出たぞ!!!!!")
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
            flag4 = false
            flag1 = true
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        cell.setupCell(model: models[indexPath.row])
        cell.newsCollectionViewDelegate = self
        //cell.layer.backgroundColor = UIColor.red.cgColor
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNewsViewController", sender: nil)
    }
}
extension HomeViewController: NewsCollectionViewDelegate {
    //Buttonをタップした後の処理メソッド
    func addButtonTaped(_ sender: UIButton) {
        //dismiss(animated: true, completion: nil)
        print("か過去垢お顔かお顔かお顔かお顔かお")
        print(sender.titleLabel?.text)
        
    }
}
