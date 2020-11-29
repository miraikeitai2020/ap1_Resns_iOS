//
//  HomeViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//


import Foundation

import UIKit

struct Model{
    
    let titleLabel: String?
    let tagLabel1: String?
    let tagLabel2: String?
    let tagLabel3: String?
    let tagLabel4: String?
    
    static func createModels() -> [Model] {
        return [Model(titleLabel: "ボボボーボボーボボ ", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "ボボボーボボーボボ", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "タイトル", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "タイトル", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "タイトル", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "タイトル", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４"),Model(titleLabel: "タイトル", tagLabel1: "ハッシュタグ１",tagLabel2: "ハッシュタグ２",tagLabel3: "ハッシュタグ３",tagLabel4: "ハッシュタグ４")]
    }
}

class HomeViewController: UIViewController ,UIGestureRecognizerDelegate,UIScrollViewDelegate{
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
    
    // スワイプ毎の上のジャンルボタンの管理
    var flag1: Bool = true
    var flag2: Bool = false
    var flag3: Bool = false
    var flag4: Bool = false
    
    
    //var articlesNice: Int!
    var articles: [[ArticlesQuery.Data.Article.Article?]?] = []
    
    // ロゴ追加
    let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
    
    var models = Model.createModels()
    
    //presenter処理
    let homePresenter = HomePresenter()
    
    var i = 0
    var a = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ロゴ追加の処理
        let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
        
        iconImage.frame = CGRect(x: 140, y: 50, width: 120, height: 60)
        self.view.addSubview(iconImage)
        
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // xib関係の処理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        //layout.itemSize = CGSize(width:, height: 242)
        collectionView.collectionViewLayout = layout
        view.addSubview(collectionView)
        /*
        dispatchGroup.enter()
        dispatchQueue.async {
            //循環参照防止のweakself
            self.homePresenter.application(completion: { [weak self] articlesArticles in
                
                guard let self = self else { return }
                
                //配列のi番目にデータが格納されている
                //self.articlesId = articlesArticles[0]?[self.i]?.id
                //self.articlesTitle = articlesArticles[0]?[self.i]?.title
                //self.articlesImagePath = articlesArticles[0]?[self.i]?.imagePath
                //self.articlesTags = articlesArticles[0]?[1]?[2]?.tags
                self.articles = articlesArticles
                print(self.articles[0]?[self.i]?.title)
                print(self.articles[0]?.count)
                //self.articlesNice = articlesArticles[0]?[self.i]?.nice
                
                
            })
        }
 */
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
        
        // ジャンル４（音楽）
        //x:値減少で左 y:値減少で上
        GenreButton4.frame = CGRect(x: 315, y: 84.5, width: 90, height: 73);
        // GenreButton4に画像を設定
        GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
        // GenreButton3を追加
        self.view.addSubview(GenreButton4)
        
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
        
        // ジャンル1（アニメ・漫画）
        GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
        // GenreButton1に画像を設定
        GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
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
            GenreButton4.setImage(UIImage(named: "1-5"), for: UIControl.State())
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
            GenreButton2.setImage(UIImage(named: "1-7"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-13"), for: UIControl.State())
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
            GenreButton4.setImage(UIImage(named: "1-1"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-5"), for: UIControl.State())
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
            GenreButton1.setImage(UIImage(named: "1-19"), for: UIControl.State())
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
            GenreButton4.setImage(UIImage(named: "1-7"), for: UIControl.State())
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
            GenreButton2.setImage(UIImage(named: "1-5"), for: UIControl.State())
            // GenreButton2を追加
            self.view.addSubview(GenreButton2)
            
            // ジャンル1
            GenreButton1.frame = CGRect(x: -10, y: -20, width: 425, height: 300);
            // GenreButton1に画像を設定
            GenreButton1.setImage(UIImage(named: "1-15"), for: UIControl.State())
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
            GenreButton4.setImage(UIImage(named: "1-3"), for: UIControl.State())
            // GenreButton3を追加
            self.view.addSubview(GenreButton4)
            
            // ジャンル３
            GenreButton3.frame = CGRect(x: 215, y: 85, width: 90, height: 73);
            // GenreButton3に画像を設定
            GenreButton3.setImage(UIImage(named: "1-7"), for: UIControl.State())
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
            GenreButton1.setImage(UIImage(named: "1-17"), for: UIControl.State())
            // GenreButton1を追加
            self.view.addSubview(GenreButton1)
            flag4 = false
            flag1 = true
        }
    }
    /*
     func articlemethod(){
     //循環参照防止のweakself
     homePresenter.application(completion: { [weak self] articlesArticles in
     
     guard let self = self else { return }
     
     //配列のi番目にデータが格納されている
     self.articlesId = articlesArticles[0]?[self.i]?.id
     self.articlesTitle = articlesArticles[0]?[self.i]?.title
     self.articlesImagePath = articlesArticles[0]?[self.i]?.imagePath
     //self.articlesTags = articlesArticles[0]?[1]?[2]?.tags
     
     self.articlesNice = articlesArticles[0]?[self.i]?.nice
     
     print(self.articlesId)
     print(self.articlesTitle)
     print(self.articlesImagePath)
     print(self.articlesNice)
     self.a += 1
     self.i += 1
     print(self.a)
     
     
     })
     
     }
     */
}
/*
 extension HomeViewController: UICollectionViewDataSource {
 
 
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return models.count
 }
 /*
 func numberOfSections(in tableView: UITableView) -> Int {
 return 1
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return targetNews.count
 }
 */
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
 cell.setupCell(model: models[indexPath.row])
 
 self.a += 1
 print(self.a)
 cell.newsCollectionViewDelegate = self
 //cell.layer.backgroundColor = UIColor.red.cgColor
 return cell
 }
 }
 */

extension HomeViewController: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        //cell.titleLabel.text = self.articles[0]?[0]?.title
        //循環参照防止のweakself
        self.homePresenter.application(completion: { [weak self] articlesArticles in
            
            guard let self = self else { return }
            
            //配列のi番目にデータが格納されている
           
            self.articles = articlesArticles

            //記事タイトルの設定
            cell.titleLabel.text = self.articles[0]?[indexPath.row]?.title
            //記事ハッシュタグの設定
            cell.tagButton1.setTitle("#"+(self.articles[0]?[indexPath.row]?.tags?[0])!, for: .normal)
            cell.tagButton2.setTitle("#"+(self.articles[0]?[indexPath.row]?.tags?[1])!, for: .normal)
            cell.tagButton3.setTitle("#"+(self.articles[0]?[indexPath.row]?.tags?[2])!, for: .normal)
            cell.tagButton4.setTitle("#"+(self.articles[0]?[indexPath.row]?.tags?[3])!, for: .normal)
            //記事画像の設定
            print("記事画像URL : \(String(describing: self.articles[0]?[indexPath.row]?.imagePath))")
            
            guard let url = URL(string: (self.articles[0]?[indexPath.row]?.imagePath)!) else { return }
            //cell.newsImage.image = UIImage(contentsOfFile: (self.articles[0]?[indexPath.row]!.imagePath)!)
            
            do {
                let data = try Data(contentsOf: url)
                cell.newsImage.image = UIImage(data: data)
            } catch let err {
                //画像がない場合デフォルトURLセット
                print(err)
            }
            
        })
        
        cell.newsCollectionViewDelegate = self
        print(articles.count)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.hidesBottomBarWhenPushed = true
        self.performSegue(withIdentifier: "toNewsViewController", sender: nil)
       
    }
}
extension HomeViewController: NewsCollectionViewDelegate {
    //Buttonをタップした後の処理メソッド
    func addButtonTaped(_ sender: UIButton) {
        //dismiss(animated: true, completion: nil)
        print(sender.titleLabel?.text)
        
    }
}
