
import Foundation
import TransitionableTab

// ライブラリ:TransitionableTabでのアニメーション定義
// アニメーションはReadme参照

enum MainTabBarAnimations {

    case move
    case fade
    case scale

    // MARK: - Function

    func getBackAnimationWhenSelectedIndex(layer: CALayer?, direction: Direction) -> CAAnimation {
        switch self {
        case .move:
            return DefineAnimation.move(.from, direction: direction)
        case .scale:
            return DefineAnimation.scale(.from)
        case .fade:
            return DefineAnimation.fade(.from)
        }
    }

    func getForwardAnimationWhenSelectedIndex(layer: CALayer?, direction: Direction) -> CAAnimation {
        switch self {
        case .move:
            return DefineAnimation.move(.to, direction: direction)
        case .scale:
            return DefineAnimation.scale(.to)
        case .fade:
            return DefineAnimation.fade(.to)
        }
    }
}
