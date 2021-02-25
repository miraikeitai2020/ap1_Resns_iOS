//
//  News3ViewController.swift
//  Resns
//
//  Created by shimotahira on 2020/11/11.
//

// レイアウト調整のためY座標を全て"-60"（コメント関連は"-50"）して上にずらしました 2021/2/17


import Foundation

import UIKit

var SaveComments: [String] = []
var SaveUserName: [String] = []
var SaveUserURL: [String] = []
var SaveContents: [String] = []

class News3ViewController: UIViewController, UIGestureRecognizerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
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
    var articleTags1: String!
    var articleTags2: String!
    var articleTags3: String!
    var articleTags4: String!
    
    var articleComment:[ArticleQuery.Data.Article.Info.Comment?]?
    var commentsCell:[ArticleQuery.Data.Article.Info.Comment?]?
    
    //var articleComment: [[ArticleQuery.Data.Article.Info.Comment?]?] = []
    
    //var articles: [[ArticlesQuery.Data.Article.Article?]?] = []
    
    // Article(comment関連)
    var articleuserName: String!
    //var articleuserImage
    var articlecontents: String!
    
    var article: [ArticleQuery.Data.Article.Info?]? = []
    
    
    
    //クロージャー内の宣言
    let titleLabel = UILabel() // ラベルの生成
    let NewsImage = UIImageView()
    var NiceCount: Int!
    var NewsTextView: UITextView = UITextView(frame: CGRect(x: 53, y: 550, width: 315, height: 450))
    let userNameLabel = UILabel()
    
    var niceLabel = UILabel() // ラベルの生成
    
    // コメント欄が表示されるview（仮）
    let CommentTextView: UITextView = UITextView(frame: CGRect(x: 53, y: 550, width: 315, height: 400))
    let CommentView = UIView.init(frame: CGRect.init(x: 53, y: 550, width: 315, height: 50))
    let commentCollectionView = UICollectionView(frame: CGRect(x: 53, y: 600, width: 315, height: 380),collectionViewLayout: UICollectionViewFlowLayout())
    
    // コメント追加欄に乗っけるユーザのアイコン
    var userIconImageView = UIImageView(image: UIImage(named:"ボボボーボ・ボーボボ"))
    // コメント入力欄作成
    let commentTextField = UITextField()
    
   
    var i = 0
    var counting = 0
    
    //UIScrollViewのインスタンス作成
    let scrollView = UIScrollView()
    
    // コメント入力をボタンに
    //let commentAddButton = UIButton(type: .custom)
    
    //presenter処理
    let articlePresenter = ArticlePresenter7()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // navigationBarを復活させる処理
        navigationController?.setNavigationBarHidden(false, animated: false)
        // navigationBarの色を変える処理
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .black
        //タブバーを隠す処理
        navigationController?.setToolbarHidden(true, animated: false)
       

        //presenter処理
        //let articlePresenter3 = ArticlePresenter3()
        let articlePresenter = ArticlePresenter7()
        
        //循環参照防止のweakself
        articlePresenter.application(completion: { [weak self] articleInfo in
            
            guard let self = self else { return }
            
            //配列の０番目にデータが格納されている
            self.articleTitle = articleInfo[0]?.title
            self.articleImagePath = articleInfo[0]?.imagePath
            self.articleNice = articleInfo[0]?.nice
            self.articleContext = articleInfo[0]?.context
            self.articleTags1 = articleInfo[0]?.tags?[0]
            self.articleTags2 = articleInfo[0]?.tags?[1]
            self.articleTags3 = articleInfo[0]?.tags?[2]
            self.articleTags4 = articleInfo[0]?.tags?[3]

            // タイトルの設定
            //print("記事タイトル : \(String(describing: self.articleTitle))")
            
            
            self.titleLabel.frame = CGRect(x: 0, y: 260, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
            self.titleLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
            self.titleLabel.text = self.articleTitle // テキストの設定
            self.titleLabel.textColor = UIColor.gray // テキストカラーの設定
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 32) // フォントの設定
            self.scrollView.addSubview(self.titleLabel) // ラベルの追加
            
            
            //記事画像の設定
            //print("記事画像URL : \(String(describing: self.articleImagePath))")
            
            guard let url = URL(string: self.articleImagePath) else { return }
 
       
            do {
                let data = try Data(contentsOf: url)
                self.NewsImage.image = UIImage(data: data)
            } catch let err {
                //画像がない場合デフォルトURLセット
                print(err)
            }
            
            self.NewsImage.frame = CGRect(x: 30, y: 50, width: 350, height: 200)
            self.scrollView.addSubview(self.NewsImage)
            
            
            // いいね数の表示
            //print("いいね数 : \(String(describing: self.articleNice))")
            
            //いいね数を譲渡
            self.NiceCount = self.articleNice
            
            self.niceLabel.frame = CGRect(x: 134, y: 365, width: UIScreen.main.bounds.size.width, height: 50) // 位置とサイズの指定
            self.niceLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
            self.niceLabel.text = String(self.NiceCount) //いいね数を設定
            self.niceLabel.textColor = UIColor.white // テキストカラーの設定
            self.niceLabel.font = UIFont.systemFont(ofSize: 10) // フォントの設定
            self.scrollView.addSubview(self.niceLabel) // ラベルの追加
            
            //print("記事本文 : \(String(describing: self.articleContext))")
            
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
            self.scrollView.addSubview(self.NewsTextView)
            
            // ハッシュタグの設定
            let titleLabel1 = UILabel() // ラベルの生成
            titleLabel1.frame = CGRect(x: -80, y: 310, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
            titleLabel1.textAlignment = NSTextAlignment.center // 横揃えの設定
            titleLabel1.text = "#"+self.articleTags1 //タグ
            titleLabel1.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
            titleLabel1.font = UIFont.systemFont(ofSize: 17) // フォントの設定
            self.scrollView.addSubview(titleLabel1) // ラベルの追加
            
            let titleLabel2 = UILabel() // ラベルの生成
            titleLabel2.frame = CGRect(x: 80, y: 310, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
            titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
            titleLabel2.text = "#"+self.articleTags2 // テキストの設定
            titleLabel2.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
            titleLabel2.font = UIFont.systemFont(ofSize: 17) // フォントの設定
            self.scrollView.addSubview(titleLabel2) // ラベルの追加
            
            let titleLabel3 = UILabel() // ラベルの生成
            titleLabel3.frame = CGRect(x: -80, y: 340, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
            titleLabel3.textAlignment = NSTextAlignment.center // 横揃えの設定
            titleLabel3.text = "#"+self.articleTags3 // テキストの設定
            titleLabel3.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
            titleLabel3.font = UIFont.systemFont(ofSize: 17) // フォントの設定
            self.scrollView.addSubview(titleLabel3) // ラベルの追加
            
            
            let titleLabel4 = UILabel() // ラベルの生成
            titleLabel4.frame = CGRect(x: 80, y: 340, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
            titleLabel4.textAlignment = NSTextAlignment.center // 横揃えの設定
            titleLabel4.text = "#"+self.articleTags4 // テキストの設定
            titleLabel4.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0)// テキストカラーの設定
            titleLabel4.font = UIFont.systemFont(ofSize: 17) // フォントの設定
            self.scrollView.addSubview(titleLabel4) // ラベルの追加

        })
        
        
        self.scrollView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        // GenreButton3セットする画像の大きさ変更

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
        ShareButton.frame = CGRect(x: 60, y: 390, width: 50, height: 50);
        // ShareButtonに画像を設定
        ShareButton.setImage(UIImage(named: "2-1-7"), for: UIControl.State())
        // ListButtonを追加
        self.scrollView.addSubview(ShareButton)
        
        // ListButtonを生成
        ListButton.frame = CGRect(x: 180, y: 390, width: 50, height: 50);
        // ListButtonに画像を設定
        ListButton.setImage(UIImage(named: "リスト"), for: UIControl.State())
        // ListButtonを追加
        self.scrollView.addSubview(ListButton)
        
        // GoodButtonを生成
        GoodButton.frame = CGRect(x: 300, y: 390, width: 50, height: 50);
        // GoodButtonに画像を設定
        GoodButton.setImage(UIImage(named: "いいね枠組み"), for: UIControl.State())
        // GoodButtonを追加
        self.scrollView.addSubview(GoodButton)
        
        
        // GoodNumberを生成
        GoodNumber.frame = CGRect(x: 330, y: 380, width: 20, height: 20);
        // GoodNumberに画像を設定
        GoodNumber.setImage(UIImage(named: "数字なし"), for: UIControl.State())
        // GoodNumberを追加
        self.scrollView.addSubview(GoodNumber)
        
        
        // デリゲートを追加
        let tapGesture1:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(News3ViewController.tappedShareButton(_:)))
        tapGesture1.delegate = self
        self.ShareButton.addGestureRecognizer(tapGesture1)
        
        let tapGesture2:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(News3ViewController.tappedListButton(_:)))
        tapGesture2.delegate = self
        self.ListButton.addGestureRecognizer(tapGesture2)
        
        let tapGesture3:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(News3ViewController.tappedGoodButton(_:)))
        tapGesture3.delegate = self
        self.GoodButton.addGestureRecognizer(tapGesture3)
        
        
        // 記事欄の一番外側
        let OughtSideView = UIView.init(frame: CGRect.init(x: 20, y: 450, width: 375, height: 570))
        OughtSideView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        OughtSideView.layer.masksToBounds = true  // 角に丸みをつける
        OughtSideView.layer.cornerRadius = 20.0   // 丸みのサイズを設定する
        OughtSideView.layer.borderWidth = 2       // 枠線の太さを設定する.
        OughtSideView.layer.borderColor = UIColor.gray.cgColor // 枠線の色をグレーに設定する.
        self.scrollView.addSubview(OughtSideView)    // OughtSideViewをViewに追加する.
       
        // セグメント（記事、コメント）
        // セグメントに追加するテキストの設定
        let params = ["記事", "コメント"]
        // UISegmentedControlを生成
        let mySegment = UISegmentedControl(items: params)
        mySegment.frame = CGRect(x: 60, y: 480, width: 300, height: 40)
        // セグメントの選択
        mySegment.selectedSegmentIndex = 0
        // セグメントが変更された時に呼び出すメソッドの設定
        mySegment.addTarget(self, action: #selector(segmentChanged(_:)), for: UIControl.Event.valueChanged)
        //mySegment.setImage(UIImage(named:"comment"),forSegmentAt: 0)
        // UISegmentedControlを追加
        self.scrollView.addSubview(mySegment)
        
        commentCollectionView.dataSource = self
        commentCollectionView.register(UINib(nibName: "CommentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CommentCollectionViewCell")
        
        //コメント欄(commentCollectionView)を表示する際のレイアウトの設定
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 290, height: 150)
        commentCollectionView.collectionViewLayout = layout
        
        // nil使ってonoffできるようになったからいらない
        // コメント追加欄(textview)を乗っけるための土台
        CommentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        CommentView.layer.masksToBounds = true  // 角に丸みをつける
        CommentView.layer.borderWidth = 0       // 枠線の太さを設定する.
        CommentView.layer.borderColor = UIColor.gray.cgColor
        
        // コメント追加欄に乗っけるユーザのアイコン
        //userIconImageView.frame = CGRect(x: 73, y: 590, width: 43, height: 43)
        
        // コメント入力欄の作成
        commentTextField.frame = CGRect(x: 60, y: 530, width: 300, height: 60)
        // 中央詰めの設定をする.
        commentTextField.textAlignment = NSTextAlignment.center
        // プレースホルダを設定
        commentTextField.placeholder = "コメントを追加"
        // キーボードタイプを指定
        commentTextField.keyboardType = .asciiCapable
        // 枠線のスタイルを設定
        commentTextField.borderStyle = .roundedRect
        // 角に丸みをつける
        //commentTextField.layer.masksToBounds = true
        // 丸みのサイズを設定する
        //commentTextField.layer.cornerRadius = 10.0
        // 枠線の太さを設定する.
        commentTextField.layer.borderWidth = 2
        // 枠線の色をグレーに設定する.
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        // TextField を閉じれるようにするためのメソッド
        commentTextField.delegate = self
        
        
        
        
        //スクリーンの幅
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        //スクリーンの高さ
        let screenHeight = Int(UIScreen.main.bounds.size.height)
        //scrollViewの大きさを設定
        scrollView.frame = self.view.frame
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:screenWidth, height:1080)
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
  
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
            self.scrollView.addSubview(self.NewsTextView)
            //コメント追加欄に載っけたユーザーアイコンを非表示に
            userIconImageView.image = nil
            //コメント追加欄を削除
            commentTextField.isHidden = true

        
        case 1:
            
            SaveUserName = []
            SaveUserURL = []
            SaveContents = []
            
          
            
            NewsTextView.text = nil
            self.scrollView.addSubview(commentTextField)
            userIconImageView.frame = CGRect(x: 73, y: 530, width: 43, height: 43)
            self.scrollView.addSubview(userIconImageView)
            commentTextField.isHidden = false
            
            // コメント追加欄をモック通りにするための処理
            let commentCoverView1 = UIView.init(frame: CGRect.init(x: 60, y: 530, width: 10, height: 60))
            commentCoverView1.backgroundColor = UIColor.white
            self.scrollView.addSubview(commentCoverView1)
            let commentCoverView2 = UIView.init(frame: CGRect.init(x: 350, y: 530, width: 10, height: 60))
            commentCoverView2.backgroundColor = UIColor.white
            self.scrollView.addSubview(commentCoverView2)
            
            self.scrollView.addSubview(commentCollectionView)
            
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
    
    // コメントを追加する際の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        commentCollectionView.register(UINib(nibName: "CommentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CommentCollectionViewCell")
        
        let NewComment = commentTextField.text!
        print("新しいコメント",NewComment)
        commentTextField.text! = ""
        
        SaveContents.insert("\(NewComment)", at:0)
        SaveUserURL.insert("a", at:0)
        SaveUserName.insert("Mori", at:0)
        // enterを押したらキーパッドが消える
        commentTextField.resignFirstResponder()
        
        self.commentCollectionView.reloadData()
        
        
        return true
    }
 
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
}

extension News3ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentCollectionView.dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell", for: indexPath) as! CommentCollectionViewCell
  
            self.articlePresenter.application(completion: { [weak self] articleInfo in
                
            guard let self = self else { return }
                
                //配列のi番目にデータが格納されている
                self.article = articleInfo
                self.articleComment = articleInfo[0]?.comments
        
                guard let unwrapped = self.articleComment?.count else { return }
                
                let savecomments = self.article?[0]?.comments
                SaveComments.append("\(savecomments)")
                //print("コメント関連の全データ個数",unwrapped)
                
                
                while( unwrapped > self.i ){
                    
                    guard let saveusername = self.articleComment?[self.i]?.userName else {return}
                    SaveUserName.append("\(saveusername)")
        
                    guard let saveuserurl = self.articleComment?[self.i]?.userImage else {return}
                    SaveUserURL.append("\(saveuserurl)")
        
                    guard let saveusercontents = self.articleComment?[self.i]?.contents else {return}
                    SaveContents.append("\(saveusercontents)")
                    
                    self.i = self.i + 1
                }
                
                if self.i < 20 && self.counting <= self.i{
                    
                    SaveUserName.append("taketo")
                    SaveUserURL.append("a")
                    SaveContents.append("懐かしい")
                    
                    self.i = self.i + 1
                }
                
                self.commentsCell = articleInfo[0]?.comments
               
                //ユーザーネーム表示
                cell.userNameLabel.text = SaveUserName[indexPath.row]
                cell.commentTextview.text = SaveContents[indexPath.row]
                
                //コメント欄に表示されたコメントを編集不可にする処理
                cell.commentTextview.isEditable = false
                
        
                let url = URL(string: (SaveUserURL[indexPath.row]))!
                
                do {
                    let data = try Data(contentsOf: url)
                    cell.userIconImage.image = UIImage(data: data)
                } catch let err {
                    //画像がない場合デフォルトURLセット
                    cell.userIconImage.image = UIImage(named: "White")
                }
           
            })
    
            return cell
        
        }
}
