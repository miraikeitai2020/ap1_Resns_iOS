//
//  News3ViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/11/11.
//



import Foundation

import UIKit

class News3ViewController: UIViewController, UIGestureRecognizerDelegate,UITextFieldDelegate {
    
    
    
    // 各ボタンの宣言
    @objc let ShareButton  = UIButton(type: .custom)
    @objc let ListButton  = UIButton(type: .custom)
    @objc let GoodButton  = UIButton(type: .custom)
    let GoodNumber = UIButton(type: .custom)
    let NewsTextButton = UIButton(type: .custom)
    let CommentButton = UIButton(type: .custom)
    
    // 各ボタンのON/OFF管理
    var flag1: Bool = false
    var flag2: Bool = false
    var flag3: Bool = false
    
    //Presenter用宣言
    
    var articleTitle: String!
    var articleImagePath: String!
    var articleNice: Int!
    var articleContext: String!
    var articleComment: [ArticleQuery.Data.Article.Info.Comment?]?
 
    var article: [[ArticleQuery.Data.Article.Info?]?] = []
    
    
    //クロージャー内の宣言
    let titleLabel = UILabel() // ラベルの生成
    let NewsImage = UIImageView()
    var NiceCount: Int!
    var NewsTextView: UITextView = UITextView(frame: CGRect(x: 53, y: 600, width: 315, height: 400))
    
    var niceLabel = UILabel() // ラベルの生成
    
    // コメント欄が表示されるview（仮）
    let CommentTextView: UITextView = UITextView(frame: CGRect(x: 53, y: 600, width: 315, height: 400))
    let CommentView = UIView.init(frame: CGRect.init(x: 53, y: 600, width: 315, height: 50))
    
    let commentCollectionView = UICollectionView( frame: CGRect(x: 53, y: 650, width: 315, height: 400),collectionViewLayout: UICollectionViewFlowLayout())
    
    // コメント追加欄に乗っけるユーザのアイコン
    var userIconImageView = UIImageView(image: UIImage(named:"ボボボーボ・ボーボボ"))
    // コメント入力欄作成
    let commentTextField = UITextField()
    
   
    var i = 0
    // コメント入力をボタンに
    //let commentAddButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationcontrollerを復活させる処理
        navigationController?.setNavigationBarHidden(false, animated: false)
        //タブバーを隠す処理
        navigationController?.setToolbarHidden(true, animated: false)

        //presenter処理
        let articlePresenter = ArticlePresenter3()
        //循環参照防止のweakself
        articlePresenter.application(completion: { [weak self] articleInfo in
            
            guard let self = self else { return }
            
            //配列の０番目にデータが格納されている
            self.articleTitle = articleInfo[0]?.title
            self.articleImagePath = articleInfo[0]?.imagePath
            self.articleNice = articleInfo[0]?.nice
            self.articleContext = articleInfo[0]?.context
            self.articleComment = articleInfo[0]?.comments
            //self.article = articleInfo
            //self.articles = articlesArticles
            // タイトルの設定
            print("記事タイトル : \(String(describing: self.articleTitle))")
            
            
            self.titleLabel.frame = CGRect(x: 0, y: 320, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
            self.titleLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
            self.titleLabel.text = self.articleTitle // テキストの設定
            self.titleLabel.textColor = UIColor.gray // テキストカラーの設定
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 32) // フォントの設定
            self.view.addSubview(self.titleLabel) // ラベルの追加
            
            
            //記事画像の設定
            print("記事画像URL : \(String(describing: self.articleImagePath))")
            /*
            print("記事画像URL : \(String(describing: self.article[0]?[i]?.imagePath))")
            
            guard let url = URL(string: (self.articles[0]?[indexPath.row]?.imagePath)!) else { return }
             */
            guard let url = URL(string: self.articleImagePath) else { return }
 
       
            do {
                let data = try Data(contentsOf: url)
                self.NewsImage.image = UIImage(data: data)
            } catch let err {
                //画像がない場合デフォルトURLセット
                print(err)
            }
            
            self.NewsImage.frame = CGRect(x: 30, y: 110, width: 350, height: 200)
            self.view.addSubview(self.NewsImage)
            
            
            // いいね数の表示
            print("いいね数 : \(String(describing: self.articleNice))")
            
            //いいね数を譲渡
            self.NiceCount = self.articleNice
            
            self.niceLabel.frame = CGRect(x: 134, y: 425, width: UIScreen.main.bounds.size.width, height: 50) // 位置とサイズの指定
            self.niceLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
            self.niceLabel.text = String(self.NiceCount) //いいね数を設定
            self.niceLabel.textColor = UIColor.white // テキストカラーの設定
            self.niceLabel.font = UIFont.systemFont(ofSize: 10) // フォントの設定
            self.view.addSubview(self.niceLabel) // ラベルの追加
            
            /*var niceLabel = UILabel() // ラベルの生成
             niceLabel.frame = CGRect(x: 134, y: 425, width: UIScreen.main.bounds.size.width, height: 50) // 位置とサイズの指定
             niceLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
             niceLabel.text = String(self.NiceCount) //いいね数を設定
             niceLabel.textColor = UIColor.white // テキストカラーの設定
             niceLabel.font = UIFont.systemFont(ofSize: 10) // フォントの設定
             self.view.addSubview(niceLabel) // ラベルの追加*/
            
            
            print("記事本文 : \(String(describing: self.articleContext))")
            
            // 実際に記事のテキストが表示される場所（外枠は透明）
            // TextViewの背景を白に設定する.
            self.NewsTextView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            // TextViewの編集
            self.NewsTextView.isEditable = false
            // 枠線の太さを設定する.
            self.NewsTextView.layer.borderWidth = 0
            // 枠線の色をグレーに設定する.
            self.NewsTextView.layer.borderColor = UIColor.gray.cgColor
            //　フォント設定
            self.NewsTextView.font = UIFont(name:"Hiragino Kaku Gothic ProN",size:15)
            // 表示させるテキストを入れる場所
            self.NewsTextView.text = self.articleContext
            
            // 左詰めの設定をする.
            self.NewsTextView.textAlignment = NSTextAlignment.left
            self.NewsTextView.scrollRangeToVisible(NSMakeRange(1,10))
            // TextViewをViewに追加する.
            self.view.addSubview(self.NewsTextView)
            
            
            print("記事コメント : \(String(describing: self.articleComment))")
            
            
            
        })
        
        
        //UIScrollViewのインスタンス作成
        let scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView.frame = self.view.frame
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:3000)
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        
        
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // GenreButton3セットする画像の大きさ変更
        
        // ハッシュタグの設定
        let titleLabel1 = UILabel() // ラベルの生成
        titleLabel1.frame = CGRect(x: -80, y: 370, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel1.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel1.text = "#アニメ・漫画" //
        titleLabel1.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel1.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel1) // ラベルの追加
        
        let titleLabel2 = UILabel() // ラベルの生成
        titleLabel2.frame = CGRect(x: 80, y: 370, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel2.text = "#澤井啓夫" // テキストの設定
        titleLabel2.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel2.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel2) // ラベルの追加
        
        let titleLabel3 = UILabel() // ラベルの生成
        titleLabel3.frame = CGRect(x: -80, y: 400, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel3.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel3.text = "#ジャンプ" // テキストの設定
        titleLabel3.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel3.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel3) // ラベルの追加
        
        
        let titleLabel4 = UILabel() // ラベルの生成
        titleLabel4.frame = CGRect(x: 80, y: 400, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel4.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel4.text = "#ギャグ漫画" // テキストの設定
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
        
        // GoodButtonにセットする画像の大きさ変更
        GoodNumber.imageView?.contentMode = .scaleAspectFit
        GoodNumber.contentHorizontalAlignment = .fill
        GoodNumber.contentVerticalAlignment = .fill
        
        // NewsTextButtonにセットする画像の大きさ変更
        NewsTextButton.imageView?.contentMode = .scaleAspectFit
        NewsTextButton.contentHorizontalAlignment = .fill
        NewsTextButton.contentVerticalAlignment = .fill
        
        // CommentButtonにセットする画像の大きさ変更
        CommentButton.imageView?.contentMode = .scaleAspectFit
        CommentButton.contentHorizontalAlignment = .fill
        CommentButton.contentVerticalAlignment = .fill
        
        
        // ShareButtonを生成
        ShareButton.frame = CGRect(x: 60, y: 450, width: 50, height: 50);
        // ShareButtonに画像を設定
        ShareButton.setImage(UIImage(named: "2-1-7"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ShareButton)
        
        // ListButtonを生成
        ListButton.frame = CGRect(x: 180, y: 450, width: 50, height: 50);
        // ListButtonに画像を設定
        ListButton.setImage(UIImage(named: "リスト"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ListButton)
        
        // GoodButtonを生成
        GoodButton.frame = CGRect(x: 300, y: 450, width: 50, height: 50);
        // GoodButtonに画像を設定
        GoodButton.setImage(UIImage(named: "いいね枠組み"), for: UIControl.State())
        // GoodButtonを追加
        self.view.addSubview(GoodButton)
        
        
        // GoodNumberを生成
        GoodNumber.frame = CGRect(x: 330, y: 440, width: 20, height: 20);
        // GoodNumberに画像を設定
        GoodNumber.setImage(UIImage(named: "数字なし"), for: UIControl.State())
        // GoodNumberを追加
        self.view.addSubview(GoodNumber)
        
        // デリゲートを追加
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(NewsViewController.tappedShareButton(_:)))
        tapGesture1.delegate = self
        self.ShareButton.addGestureRecognizer(tapGesture1)
        
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(NewsViewController.tappedListButton(_:)))
        tapGesture2.delegate = self
        self.ListButton.addGestureRecognizer(tapGesture2)
        
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(NewsViewController.tappedGoodButton(_:)))
        tapGesture3.delegate = self
        self.GoodButton.addGestureRecognizer(tapGesture3)
        
        
        // 記事欄の一番外側
        let OughtSideView = UIView.init(frame: CGRect.init(x: 20, y: 500, width: 375, height: 500))
        OughtSideView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        OughtSideView.layer.masksToBounds = true  // 角に丸みをつける
        OughtSideView.layer.cornerRadius = 20.0   // 丸みのサイズを設定する
        OughtSideView.layer.borderWidth = 2       // 枠線の太さを設定する.
        OughtSideView.layer.borderColor = UIColor.gray.cgColor // 枠線の色をグレーに設定する.
        self.view.addSubview(OughtSideView)    // OughtSideViewをViewに追加する.
       
        // セグメント（記事、コメント）
        // セグメントに追加するテキストの設定
        let params = ["記事", "コメント"]
        // UISegmentedControlを生成
        let mySegment = UISegmentedControl(items: params)
        mySegment.frame = CGRect(x: 60, y: 530, width: 300, height: 40)
        // セグメントの選択
        mySegment.selectedSegmentIndex = 0
        // セグメントが変更された時に呼び出すメソッドの設定
        mySegment.addTarget(self, action: #selector(segmentChanged(_:)), for: UIControl.Event.valueChanged)
        //mySegment.setImage(UIImage(named:"comment"),forSegmentAt: 0)
        // UISegmentedControlを追加
        self.view.addSubview(mySegment)
        
        commentCollectionView.dataSource = self
        commentCollectionView.register(UINib(nibName: "CommentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CommentCollectionViewCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 290, height: 200)
        commentCollectionView.collectionViewLayout = layout
        //commentCollectionView.isEditable = false
        
        //view.addSubview(commentCollectionView)
        
        // nil使ってonoffできるようになったからいらない
        // コメント追加欄(textview)を乗っけるための土台
        CommentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        CommentView.layer.masksToBounds = true  // 角に丸みをつける
        CommentView.layer.borderWidth = 0       // 枠線の太さを設定する.
        CommentView.layer.borderColor = UIColor.gray.cgColor
        
        // コメント追加欄に乗っけるユーザのアイコン
        //userIconImageView.frame = CGRect(x: 73, y: 590, width: 43, height: 43)
        
        // コメント入力欄の作成
        commentTextField.frame = CGRect(x: 60, y: 580, width: 300, height: 60)
        // 中央詰めの設定をする.
        commentTextField.textAlignment = NSTextAlignment.center
        // プレースホルダを設定
        commentTextField.placeholder = "コメントを追加"
        // キーボードタイプを指定
        commentTextField.keyboardType = .asciiCapable
        // 枠線のスタイルを設定
        commentTextField.borderStyle = .roundedRect
        // 角に丸みをつける
        commentTextField.layer.masksToBounds = true
        // 丸みのサイズを設定する
        commentTextField.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        commentTextField.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        
        // TextField を閉じれるようにするためのメソッド
        commentTextField.delegate = self
 
        // UITextFieldを追加
        //self.view.addSubview(commentTextField)
        /*
        // コメント追加ボタンに挿入する画像の大きさ調整 
        commentAddButton.imageView?.contentMode = .scaleAspectFit
        commentAddButton.contentHorizontalAlignment = .fill
        commentAddButton.contentVerticalAlignment = .fill
        // コメント追加ボタン
        commentAddButton.frame = CGRect(x: 60, y: 580, width: 300, height: 60);
        // コメント追加ボタンに画像を設定
        commentAddButton.setImage(UIImage(named: "コメントを追加"), for: UIControl.State())
        */
        // コメント追加ボタンを追加
        //self.view.addSubview(commentAddButton)
        
        // "＜"(戻るボタン）の追加
        let chevronLeftImage: UIImage? = UIImage(systemName: "chevron.left")
        let backButton = UIBarButtonItem(image: chevronLeftImage, style: .plain, target: self, action: #selector(onTapBackButton(_:)))
        navigationItem.leftBarButtonItem = backButton
 
    }
    // "＜"(戻るボタン）のメソッド
    @objc func onTapBackButton(_ sender: UIBarButtonItem) {
        navigationController?.hidesBottomBarWhenPushed = false
        
        navigationController?.popViewController( animated: true)
        // navigationcontrollerを隠す処理
        navigationController?.setNavigationBarHidden(true, animated: false)
        //navigationController?.hidesBottomBarWhenPushed = false
        
        //self.hidesBottomBarWhenPushed = false
    }

    // セグメントのメソッド
    @objc func segmentChanged(_ segment:UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            //print("左を選択した。")
            print("記事本文 : \(String(describing: self.articleContext))")
            // 実際に記事のテキストが表示される場所（外枠は透明）
            // TextViewの背景を白に設定する.
            self.NewsTextView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
            // TextViewの編集
            self.NewsTextView.isEditable = false
            // 枠線の太さを設定する.
            self.NewsTextView.layer.borderWidth = 0
            // 枠線の色をグレーに設定する.
            self.NewsTextView.layer.borderColor = UIColor.gray.cgColor
            //　フォント設定
            self.NewsTextView.font = UIFont(name:"Hiragino Kaku Gothic ProN",size:15)
            // 表示させるテキストを入れる場所
            self.NewsTextView.text = self.articleContext
            // 左詰めの設定をする.
            self.NewsTextView.textAlignment = NSTextAlignment.left
            self.NewsTextView.scrollRangeToVisible(NSMakeRange(1,10))
            // TextViewをViewに追加する.
            self.view.addSubview(self.NewsTextView)
            //コメント追加欄に載っけたユーザーアイコンを非表示に
            userIconImageView.image = nil
            //コメント追加欄を削除
            commentTextField.isHidden = true
            //コメント追加ボタンを非表示に
            //commentAddButton.isHidden = true
        //self.NewsTextView.backgroundColor = UIColor.blue
        
        case 1:
            //print("右を選択した。")
            //self.view.addSubview(CommentView)
            NewsTextView.text = nil
            self.view.addSubview(commentTextField)
            userIconImageView = UIImageView(image: UIImage(named:"ボボボーボ・ボーボボ"))
            userIconImageView.frame = CGRect(x: 73, y: 590, width: 43, height: 43)
            self.view.addSubview(userIconImageView)
            /*
            self.view.addSubview(commentAddButton)
            commentAddButton.isHidden = false
            */
            commentTextField.isHidden = false
            self.view.addSubview(commentCollectionView)
            self.commentCollectionView.backgroundColor = UIColor.white
        default:
            break
        }
    }
    
    @objc func tappedShareButton(_ sender: UITapGestureRecognizer){
        
        let ShareTitle = String("「Re:sns」で懐かしいを共有しよう！\n")
        
        //リリース後はアプリに飛ぶ
        let myWebsite = NSURL(string:"https://www.fun.ac.jp/")
        let HashTag = String("\n#Resns\n")
        let shareItems = [ShareTitle, self.titleLabel.text, self.articleContext, myWebsite, HashTag] as [Any]
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        present(controller, animated: true, completion: nil)
        
    }
    
    @objc func tappedListButton(_ sender: UITapGestureRecognizer){
        
        if flag2 == false {
            //選択時に走らせたい処理
            flag2 = true
            ListButton.setImage(UIImage(named: "リスト選択ver2"), for: UIControl.State())
        } else {
            //取り消す時に走らせたい処理
            flag2 = false
            ListButton.setImage(UIImage(named: "リスト"), for: UIControl.State())
        }
    }
    
    @objc func tappedGoodButton(_ sender: UITapGestureRecognizer){
        
        if flag3 == false {
            //選択時に走らせたい処理
            flag3 = true
            
            print(self.NiceCount + 1)
            self.niceLabel.text = String(self.NiceCount + 1)
            
            //いいね時の画像切り替え
            GoodButton.setImage(UIImage(named: "いいねした"), for: UIControl.State())
        } else {
            //取り消す時に走らせたい処理
            flag3 = false
            
            
            print(self.NiceCount)
            niceLabel.text = String(self.NiceCount)
            
            //いいね取り消し時の画像切り替え
            GoodButton.setImage(UIImage(named: "いいね枠組み"), for: UIControl.State())
        }
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // キーボードを閉じる
            textField.resignFirstResponder()
            return true
        }
}
extension News3ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollectionView.dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell", for: indexPath) as! CommentCollectionViewCell
        return cell
    }
    
    
}

