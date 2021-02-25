//
//  SceneDelegate.swift
//  My Janken
//
//  Created by 鳥山英峻 on 2020/08/08.
//  Copyright © 2020 鳥山英峻. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
        
        
        // UserDefaults（年）を初期化
        UserDefaults.standard.set(0, forKey: "year")
        // UserDefaults（月）を初期化
        UserDefaults.standard.set(0, forKey: "month")
        
        // UserDefaults（ジャンル）を初期化
        UserDefaults.standard.set("アニメ・漫画", forKey: "genre")
        // UserDefaults（サーチ）を初期化
        UserDefaults.standard.set("", forKey: "Search")
        
        
        
       
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
         window = UIWindow(windowScene: windowScene)
         window?.rootViewController = UIStoryboard(name: "Start", bundle: nil).instantiateInitialViewController()
         window?.makeKeyAndVisible()
         window?.windowScene = windowScene
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

