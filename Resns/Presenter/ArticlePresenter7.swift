//
//  ArticlePresenter7.swift
//  Resns
//
//  Created by shimotahira on 2021/02/06.
//

import Foundation

class ArticlePresenter7{
    
    //var newsID = UserDefaults.standard.integer(forKey: "newsNumber")

    func application(completion: @escaping ([ArticleQuery.Data.Article.Info?]) -> Void) {
        // 18はボーボボ
            var newsID = UserDefaults.standard.integer(forKey: "newsNumber")
            Network.shared.apollo.fetch(query: ArticleQuery(articleid: "\(newsID ?? 4)" )) { result in
            switch result{
            case .success(let response):
                completion([response.data?.article.info])
               
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
