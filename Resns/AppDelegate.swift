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
        
                Network.shared.apollo.fetch(query: ArticlesQuery(genre: "Anime")) { result in
                    
                    switch result{
                    case .success(let response):
                        let Article = response.data?.articles.articles
                        
                        print(Article)

                        
                    case .failure(let error):
                        print(error)
                    }
                }
    
        return true
    }
    

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

