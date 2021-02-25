//
//  MainTabBarController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/11.
//

import UIKit
import FontAwesome_swift
import TransitionableTab

final class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let selectedTabBarAnimation: MainTabBarAnimations = .move
    
    // MARK: -Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITabBarControllerの初期設定に関する調整
        setupMainTabBarInitialSetting()
        
        // GlobalTabBarControllerで表示したい画面に関する設定処理
        setupMainTabBarContents()
        
        let iconImage = UIImageView(image: UIImage(named: "rogo_katto"))
        iconImage.frame = CGRect(x: 145, y: 50, width: 120, height: 60)
        self.view.addSubview(iconImage)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }
    
    //タブ選択時に実行する処理
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // UITabBarに配置されているアイコン画像をアニメーションさせるための処理
        // 現在配置されているUITabBarからUIImageViewを取得して配列にする
        
        var tabBarImageViews: [UIImageView] = []
        let targetClass: AnyClass = NSClassFromString("UITabBarButton")!
        if #available(iOS 13.0, *) {
            // MEMO: iOS13以降ではUITabBarItem内の構造が変化しているので取得位置が変わる
            tabBarImageViews = tabBar.subviews
                .filter{ $0.isKind(of: targetClass) }
                .map{ $0.subviews[1] as! UIImageView }
        } else {
            tabBarImageViews = tabBar.subviews
                .filter{ $0.isKind(of: targetClass) }
                .map{ $0.subviews.first as! UIImageView }
        }
        // アイコン画像にバウンドさせるアニメーションを付与する
        executeBounceAnimationFor(selectedImageView: tabBarImageViews[item.tag])
    }
    
    //MARK: - Private Function
    
    // UITabBarControllerの初期設定に関する調整
    private func setupMainTabBarInitialSetting() {
        
        // UITabBarControllerDelegateの宣言
        self.delegate = self
        
        // 初期設定として空のUIViewControllerのインスタンスを追加
        self.viewControllers = [UIViewController(), UIViewController(),
            UIViewController(),UIViewController()]
    }
    
    //GlobalTabBarControllerで表示したい画面に関する設定処理
    private func setupMainTabBarContents() {
        
        // タブの選択時・非選択時の色とアイコンのサイズを決める
        
        //アイコンサイズ,通常色,選択時の色,フォント
        let itemSize = CGSize(width: 28.0,height: 28.0)
        let normalColor: UIColor = UIColor(code: "#bcbcbc")
        let selectedColer: UIColor = UIColor(code: "696969")
        let tabBarItemFont = UIFont(name: "HirakakuProN-W6", size: 10)
        
        // Tabbar用のAttributeを決定する
        let normalAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont as Any,
            NSAttributedString.Key.foregroundColor: normalColor
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont as Any,
            NSAttributedString.Key.foregroundColor: selectedColer
        ]
        
        // TabBarに表示する画面を決める
        let _ = MainTabBarItems.allCases.enumerated().map { (index, item) in
            
            //該当ViewControllerの設置
            guard let vc = item.getViewController() else {
                // 通れば必ず落ちる
                fatalError()
            }
            self.viewControllers?[index] = vc
            
            //　該当ViewControllerのタイトル設置
            self.viewControllers?[index].title = item.getTitle()
            
            // 該当ViewControllerのタブバー要素設置
            self.viewControllers?[index].tabBarItem.tag = index
            self.viewControllers?[index].tabBarItem.setTitleTextAttributes(normalAttributes, for: [])
            
            self.viewControllers?[index].tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
            
            self.viewControllers?[index].tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -1.5)
            
            self.viewControllers?[index].tabBarItem.image = UIImage.fontAwesomeIcon(name: item.getFontAwesomeIcon(), style: .solid, textColor: normalColor, size: itemSize).withRenderingMode(.alwaysOriginal)
            
            self.viewControllers?[index].tabBarItem.selectedImage =
                UIImage.fontAwesomeIcon(name: item.getFontAwesomeIcon(), style: .solid, textColor: selectedColer, size: itemSize).withRenderingMode(.alwaysOriginal)
        }
    }
    
    // 該当のUIImageViewに対してバウンドするアニメーションを実行する
    // アニメーション自体は0.18秒で実行され＆割り込みを許可する
    private func executeBounceAnimationFor(selectedImageView: UIImageView){
        UIView.animateKeyframes(withDuration: 0.18, delay: 0.0, options: [.allowUserInteraction, .autoreverse], animations: {
            
            //全体のアニメーション時間の中のどの地点からアニメーションを開始するかを0.0〜1.0の間で指定する
            // withRelativeStartTime: 0.16*0秒後に実行する
            // relativeDuration: アニメーション時間を1.0秒とする
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {selectedImageView.transform = CGAffineTransform(scaleX: 1.14, y:1.14)})
            
            
            // withRelativeStartTime: 0.16*0.5秒後に実行する
            // relativeDuration: アニメーション時間を1.0秒とする
            UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 1.0, animations: {
                selectedImageView.transform = CGAffineTransform.identity
            })
        })
    }
}

// MARK: - TransitionableTab

// UITabBarControllerDelegateの処理がすでにTransitionableTabプロトコルで考慮している
extension MainTabBarController: TransitionableTab {

    // アニメーションの実行秒数
    func transitionDuration() -> CFTimeInterval {
        return 0.36
    }

    // アニメーションの実行オプション
    func transitionTimingFunction() -> CAMediaTimingFunction {
        return .easeInOut
    }

    // コンテンツ切り替え時にタブのインデックス値が増加する場合に実行するアニメーションの設定
    func fromTransitionAnimation(layer: CALayer?, direction: Direction) -> CAAnimation {
        // MEMO: 戻るアニメーションを、別途定義したMainTabBarAnimationsより取得する
        return selectedTabBarAnimation.getBackAnimationWhenSelectedIndex(layer: layer, direction: direction)
    }

    // コンテンツ切り替え時にタブのインデックス値が減少する場合に実行するアニメーションの設定
    func toTransitionAnimation(layer: CALayer?, direction: Direction) -> CAAnimation {
        // MEMO: 進むアニメーションを、別途定義したMainTabBarAnimationsより取得する
        return selectedTabBarAnimation.getForwardAnimationWhenSelectedIndex(layer: layer, direction: direction)
    }

    // コンテンツ切り替え時に実行される処理
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return animateTransition(tabBarController, shouldSelect: viewController)
    }
}
