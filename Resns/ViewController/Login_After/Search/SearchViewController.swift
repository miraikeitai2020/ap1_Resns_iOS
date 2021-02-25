//
//  SearchViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/10.
//

import Foundation

import UIKit



class SearchViewController: UIViewController,UIGestureRecognizerDelegate,UIScrollViewDelegate,UITextFieldDelegate{
    
    var delegate: NewsCollectionViewDelegate?
    
    var articles: [[ArticlesFromTagQuery.Data.ArticlesFromTag.Article?]?] = []
    
    //presenter処理
    let searchPresenter = SearchPresenter()

    var i = 0

    var n : Int!
    var start = 0
    
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

    var counting = 0

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 記事を開いたときにでるbackボタンの文字を「戻る」に変更する処理
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: nil, action: nil)
        
        // UITextFieldを生成
        let textField = UITextField()
        textField.frame = CGRect(x: 110, y: 110, width: 225, height: 28)
        // プレースホルダを設定
        textField.placeholder = "タグ検索"
        // キーボードタイプを指定
        textField.keyboardType = .default
        // 枠線のスタイルを設定
        textField.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        textField.returnKeyType = .done
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        // UITextFieldを追加
        self.view.addSubview(textField)
        // デリゲートを指定
        textField.delegate = self
        // searchberにタグを表示
        var search = UserDefaults.standard.string(forKey: "Search")
        textField.text = search
        
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        // xib関係の処理
        collectionView.delegate = self
        //collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        //layout.itemSize = CGSize(width:, height: 242)
        collectionView.collectionViewLayout = layout
        view.addSubview(collectionView)
        //self.view.bringSubviewToFront(collectionView)
        
        
        
    }
    
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
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
        
        let searchWord = textField.text!
        print("あいうえお",searchWord)
      
        UserDefaults.standard.set(searchWord, forKey: "Search")
        // enterを押したらキーパッドが消える
        textField.resignFirstResponder()
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        self.start = 1
        self.collectionView.reloadData()
        
        return true
    }

    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Clear")
        return true
    }

    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }

    // テキストフィールドでの編集が終了する直前での処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
    }
}


//collectionViewの生成
extension SearchViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let semaphore = DispatchSemaphore(value: 0)
         
            self.searchPresenter.application(completion: { [weak self] articlesArticles in
                
                guard let self = self else { return }
                
                self.articles = articlesArticles
                
                guard let unwrapped = self.articles[0]?.count else { return }
                self.counting = unwrapped
                print("記事の個数",unwrapped)
    
                
                while self.counting > self.i  {
                    //記事IDを全取得
                    guard let NewIDnumbers = self.articles[0]?[self.i]?.id else { return }
                    self.IDnumbers.append("\(NewIDnumbers)")
                    
                    guard let savetitle = self.articles[0]?[self.i]?.title else { return }
                    self.SaveTitle.append("\(savetitle)")
                    
                    //タグを全取得
                    guard let savetag = self.articles[0]?[self.i]?.tags?[0] else { return }
                    self.SaveTag.append("\("#"+savetag)")
                    guard let savetag2 = self.articles[0]?[self.i]?.tags?[1] else { return }
                    self.SaveTag2.append("\("#"+savetag2)")
                    guard let savetag3 = self.articles[0]?[self.i]?.tags?[2] else { return }
                    self.SaveTag3.append("\("#"+savetag3)")
                    guard let savetag4 = self.articles[0]?[self.i]?.tags?[3] else { return }
                    self.SaveTag4.append("\("#"+savetag4)")
                    
                    guard let saveurl = self.articles[0]?[self.i]?.imagePath else { return }
                    self.SaveURL.append("\(saveurl)")
                    
                    self.i = self.i + 1
                    print(self.i)
                    
                }
                
                if self.i < 10 && self.counting <= self.i{
                    self.IDnumbers.append("")
                    self.SaveTitle.append("")
                    self.SaveTag.append("")
                    self.SaveTag2.append("")
                    self.SaveTag3.append("")
                    self.SaveTag4.append("")
                    self.SaveURL.append("a")
                    self.i = self.i + 1
                }
            })
        
        
        if(self.start == 1){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    //記事タイトルの設定
                cell.titleLabel.text = self.SaveTitle[indexPath.row]
                    //記事ハッシュタグの設定
                cell.tagButton1.setTitle((self.SaveTag[indexPath.row]), for: .normal)
                cell.tagButton2.setTitle((self.SaveTag2[indexPath.row]), for: .normal)
                cell.tagButton3.setTitle((self.SaveTag3[indexPath.row]), for: .normal)
                cell.tagButton4.setTitle((self.SaveTag4[indexPath.row]), for: .normal)
                        
                let url = URL(string: (self.SaveURL[indexPath.row]))!
                
                    do {
                        let data = try Data(contentsOf: url)
                        cell.newsImage.image = UIImage(data: data)
                    } catch let err {
                        //画像がない場合デフォルトURLセット
                        cell.newsImage.image = UIImage(named: "White")
                    }
            }
        }
                
        cell.newsCollectionViewDelegate = self
        return cell
    }}

extension SearchViewController:UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("ID",IDnumbers)
            
        var eachIDnumber = IDnumbers[indexPath.row]
        UserDefaults.standard.set(eachIDnumber, forKey: "newsNumber")
        
        self.performSegue(withIdentifier: "toNews3ViewController", sender: nil)
       
    }
}

extension SearchViewController: NewsCollectionViewDelegate {
    //Buttonをタップした後の処理メソッド
    func addButtonTaped(_ sender: UIButton) {
        
        print(sender.titleLabel?.text)
        
    }
}
