
import Foundation
import UIKit
import FontAwesome_swift

// MainTabBarControllerへ配置するものに関する設定
enum MainTabBarItems: CaseIterable {

    case Home
    case Search
    case List
    case Acount

    // MARK: - Function

    // 該当のViewControllerを取得する
    func getViewController() -> UIViewController? {
        var storyboardName: String
        switch self {
        case .Home:
            storyboardName = "Home"
        case .Search:
            storyboardName = "Search"
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
        case .Search:
            return 1
        case .List:
            return 2
        case .Acount:
            return 3
        }
    }

    // MainTabBarのタイトルを取得する
    func getTitle() -> String {
        switch self {
        case .Home:
            return "ホーム"
        case .Search:
            return "検索"
        case .List:
            return "リスト"
        case .Acount:
            return "アカウント"
        }
    }

    // TabBarに使うFontAwesomeアイコン名を取得する
    func getFontAwesomeIcon() -> FontAwesome {
        switch self {
        case .Home:
            return .home
        case .Search:
            return .search
        case .List:
            return .bookmark
        case .Acount:
            return .userCircle
        }
    }
}

