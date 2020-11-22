//
//  ArticlePresenter4.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/11/11.
//

import Foundation

class ArticlePresenter4{
    
    func application(completion: @escaping ([ArticleQuery.Data.Article.Info?]) -> Void) {
        Network.shared.apollo.fetch(query: ArticleQuery(articleid: "8" )) { result in
            switch result{
            case .success(let response):
                completion([response.data?.article.info])
                
            case .failure(let error):
                print(error)
            }
        }
    }
}