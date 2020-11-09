//
//  ArticlesPresenter.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/25.
//

import Foundation


class ArticlePresenter{
    
    func application(complation: @escaping ([ArticlesQuery.Data.Article]) -> Void) {
        Network.shared.apollo.fetch(query: ArticleQuery(articleid: "11" )) { result in
            
            
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
        }
    }
}
