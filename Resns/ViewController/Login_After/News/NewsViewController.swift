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
    
    let NewsTextButton = UIButton(type: .custom)
    
    let CommentButton = UIButton(type: .custom)
    
        //let NewsImage = UIImageView(image: UIImage(named: "8pjX1BYqQyvKuGd1594490989_1594491000"))
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
       
        // 記事画像を置くところ
        let NewsImage = UIImageView(image: UIImage(named: "title-752"))
        NewsImage.frame = CGRect(x: 30, y: 110, width: 350, height: 200)
        self.view.addSubview(NewsImage)
        
        /*
        let NewsImageView = UIImageView()
        let NewsImageFileurl = "https://"
        
        NewsImageView.image =  UIImage(named: NewsImageFileurl)
        */
        // タイトルの設定
        let titleLabel = UILabel() // ラベルの生成
        titleLabel.frame = CGRect(x: 0, y: 320, width:UIScreen.main.bounds.size.width ,height: 44) // 位置とサイズの指定
        titleLabel.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel.text = "アンナチュラル" // テキストの設定
        titleLabel.textColor = UIColor.gray // テキストカラーの設定
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32) // フォントの設定
        self.view.addSubview(titleLabel) // ラベルの追加
        
        
        // ハッシュタグの設定
        let titleLabel1 = UILabel() // ラベルの生成
        titleLabel1.frame = CGRect(x: -80, y: 370, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel1.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel1.text = "#ドラマ" //
        titleLabel1.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel1.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel1) // ラベルの追加
        
        let titleLabel2 = UILabel() // ラベルの生成
        titleLabel2.frame = CGRect(x: 80, y: 370, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel2.text = "#金曜ドラマ" // テキストの設定
        titleLabel2.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel2.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel2) // ラベルの追加
        
        let titleLabel3 = UILabel() // ラベルの生成
        titleLabel3.frame = CGRect(x: -80, y: 400, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel3.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel3.text = "#石原さとみ" // テキストの設定
        titleLabel3.textColor = UIColor(red: 0, green: 0.5, blue: 0.82, alpha: 1.0) // テキストカラーの設定
        titleLabel3.font = UIFont.systemFont(ofSize: 17) // フォントの設定
        self.view.addSubview(titleLabel3) // ラベルの追加
        
        
        let titleLabel4 = UILabel() // ラベルの生成
        titleLabel4.frame = CGRect(x: 80, y: 400, width: UIScreen.main.bounds.size.width, height: 44) // 位置とサイズの指定
        titleLabel4.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel4.text = "#米津玄師" // テキストの設定
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
        
        // NewsTextButtonにセットする画像の大きさ変更
        NewsTextButton.imageView?.contentMode = .scaleAspectFit
        NewsTextButton.contentHorizontalAlignment = .fill
        NewsTextButton.contentVerticalAlignment = .fill
        
        // CommentButtonにセットする画像の大きさ変更
        CommentButton.imageView?.contentMode = .scaleAspectFit
        CommentButton.contentHorizontalAlignment = .fill
        CommentButton.contentVerticalAlignment = .fill
        
        
        
        
        
        
        // ShareButtonを生成
        ShareButton.frame = CGRect(x: 60, y: 445, width: 55, height: 55);
        // ShareButtonに画像を設定
        ShareButton.setImage(UIImage(named: "1-1-11"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ShareButton)
        
        // ListButtonを生成
        ListButton.frame = CGRect(x: 180, y: 450, width: 50, height: 50);
        // ListButtonに画像を設定
        ListButton.setImage(UIImage(named: "1-1-12"), for: UIControl.State())
        // ListButtonを追加
        self.view.addSubview(ListButton)
        
        // GoodButtonを生成
        GoodButton.frame = CGRect(x: 300, y: 440, width: 60, height: 60);
        // GoodButtonに画像を設定
        GoodButton.setImage(UIImage(named: "1-1-13"), for: UIControl.State())
        // GoodButtonを追加
        self.view.addSubview(GoodButton)
        
        
        // 記事欄の一番外側
        let OughtSideView = UIView.init(frame: CGRect.init(x: 20, y: 500, width: 375, height: 500))
        OughtSideView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        OughtSideView.layer.masksToBounds = true  // 角に丸みをつける
        OughtSideView.layer.cornerRadius = 20.0   // 丸みのサイズを設定する
        OughtSideView.layer.borderWidth = 2       // 枠線の太さを設定する.
        OughtSideView.layer.borderColor = UIColor.gray.cgColor      // 枠線の色をグレーに設定する.
        self.view.addSubview(OughtSideView)    // OughtSideViewをViewに追加する.
        
        
        // 記事とコメントボタン（行く行くはセグメンテーションに）
        // CommentButtonを生成
        CommentButton.frame = CGRect(x: 80, y: 540, width: 250, height: 35);
        // CommentButtonに画像を設定
        CommentButton.setImage(UIImage(named: "1-1-15"), for: UIControl.State())
        // GoodButtonを追加
        self.view.addSubview(CommentButton)
        
        //NewsTextButtonを生成
        NewsTextButton.frame = CGRect(x: 38, y: 542.5, width: 250, height: 30);
        // NewsTextButtonに画像を設定
        NewsTextButton.setImage(UIImage(named: "1-1-14"), for: UIControl.State())
        //NewsTextButtonを追加
        self.view.addSubview(NewsTextButton)
        
        
        // 実際に記事のテキストが表示される場所（外枠は透明）
        let NewsTextView: UITextView = UITextView(frame: CGRect(x: 53, y: 600, width: 315, height: 400))
        // TextViewの背景を白に設定する.
        NewsTextView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        // TextViewの編集
        NewsTextView.isEditable = false
        // 角に丸みをつける=>無し
        //NewsTextView.layer.masksToBounds = true
        // 丸みのサイズを設定する=>無し
        //NewsTextView.layer.cornerRadius = 20.0
        // 枠線の太さを設定する.
        NewsTextView.layer.borderWidth = 0
        // 枠線の色をグレーに設定する.
        NewsTextView.layer.borderColor = UIColor.gray.cgColor
        //
        NewsTextView.font = UIFont(name:"Hiragino Kaku Gothic ProN",size:15)
        // 表示させるテキストを入れる場所
        NewsTextView.text =
            " 2018年1月12日から石原さとみ主演のTBS系金曜ドラマ「アンナチュラル」が放送された。これまで様々な役を演じ、幅広い層から支持を得ている女優石原さとみが今回演じるのは、日本に170名ほどしか登録がない法医解剖医の三澄ミコト。ドラマの舞台となるのは、 日本に新設された死因究明の専門スペシャリストが集まる「不自然死究明研究所(UDIラボ)」である。そこには”不自然な死(アンナチュラル・デス)”の怪しい死体ばかりが運び込まれる。そのUDIラボで共に働く面々には豪華な顔ぶれが集結し、法医解剖医・中堂系役に井浦新、記録員・久部六郎役に窪田正孝、 臨床検査技師・東海林夕子役に市川実日子。そしてUDIラボの所長・神倉保夫役に松重豊が出演している。 \n\n\n 主人公ミコトが許せないことは、”不自然な死(アンナチュラル・デス)”を放置することであり、不自然な死の裏側には、必ず突き止めるべき真実がある。しかし、日本においては、不自然な死のほとんどは解剖されることなく荼毘に付されている。その現実に個性豊かなメンバーが立ち向かっていく物語である。 全体のテーマは「死と向き合うことによって、現実の世界を変えていく」であり、「死因」を見つけることによって、今を生きる人々の命を救ったり、社会制度を変えることで未来の危機を回避し、少しでもより良い世界に変えていけたら...という思いが込められている。                     \n\n\n 主題歌は米津玄師書き下ろしによる新曲「Lemon」であり、米津玄師がドラマの主題歌を担当するのは初である。大切な人を失った悲しみや喪失感を歌う1曲であり、「アンナチュラル」の”死”と”未来”という世界を巧みに表現している。\n\n\n また、ドラマ「アンナチュラル」は”世界に見せたい日本のドラマ”を選出・表彰する東京ドラマアウォード2018で作品賞・優秀賞や個人賞、主題歌賞など6冠で最多受賞となった。最終回は自己最高となる視聴率13.3％を記録した。放送後は「泣きすぎて頭痛い」や「1話からのエピソードの伏線回収がすごい」「笑って泣けて勉強になり心に残るドラマ」などといった感動の声と共に、俳優陣の演技を称賛する反応や続編の要望の声などがSNS上を飛び交った。"
        
        // 左詰めの設定をする.
        NewsTextView.textAlignment = NSTextAlignment.left
        NewsTextView.scrollRangeToVisible(NSMakeRange(1,10))
        // TextViewをViewに追加する.
        self.view.addSubview(NewsTextView)
        
    }

    //override func didReceiveMemoryWarning() {
        //super.didReceiveMemoryWarning()
    //}
}
