//
//  AppDelegate.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/09/25.
//

import UIKit
import KeychainSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let loginkey = "value"
        
        //perform Mutationはデータ受け取り
        Network.shared.apollo.perform(mutation: SignupMutation()) { [weak self] result in
            guard self == self else { return }
            
            switch result{
            case .success(let response):
                guard let token = response.data?.signup.value else { return }
                let keychain = KeychainSwift()
                keychain.set(token, forKey: loginkey)
                print(token)
            
            case .failure(let error):
                print(error)
            }
        }
        
        /*Network.shared.apollo.fetch(query: ArticleQuery(articleid:"20")) { result in
            
            
            switch result{
            case .success(let response):
                
                let Article_title = response.data?.article.info?.title
                let Article_image = response.data?.article.info?.imagePath
                let Article_nice = response.data?.article.info?.nice
                let Article_context = response.data?.article.info?.context
                
                print(Article_title!)
                print(Article_image!)
                print(Article_nice!)
                print(Article_context!)
                
            
            
            case .failure(let error):
                print(error)
            }
        }*/
    
        return true
    }
    

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

