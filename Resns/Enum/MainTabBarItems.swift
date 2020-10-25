
import Foundation
import UIKit
import FontAwesome_swift

// MainTabBarControllerへ配置するものに関する設定
enum MainTabBarItems: CaseIterable {

    case Home
    case List
    case Acount

    // MARK: - Function

    // 該当のViewControllerを取得する
    func getViewController() -> UIViewController? {
        var storyboardName: String
        switch self {
        case .Home:
            storyboardName = "Home"
        case .List:
            storyboardName = "List"
        case .Acount:
            storyboardName = "Acount"
        }
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()
    }

    // MainTabBarのインデックス番号を取得する
    func getTabIndex() -> Int {
        switch self {
        case .Home:
            return 0
        case .List:
            return 1
        case .Acount:
            return 2
        }
    }

    // MainTabBarのタイトルを取得する
    func getTitle() -> String {
        switch self {
        case .Home:
            return "ホーム"
        case .List:
            return "検索"
        case .Acount:
            return "リスト"
        }
    }

    // TabBarに使うFontAwesomeアイコン名を取得する
    func getFontAwesomeIcon() -> FontAwesome {
        switch self {
        case .Home:
            return .hamburger
        case .List:
            return .newspaper
        case .Acount:
            return .images
        }
    }
}

