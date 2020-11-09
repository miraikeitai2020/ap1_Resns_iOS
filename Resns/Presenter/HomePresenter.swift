//
//  HomePresenter.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/10/24.
//

import Foundation


class HomePresenter{
    func application() {
        Network.shared.apollo.fetch(query: ArticlesQuery(genre: "Drama")) { result in
            
            switch result{
            case .success(let response):
                _ = response.data?.articles.articles
                
                
                //print(Article)

                
            case .failure(let error):
                print(error)
            }
        }
    }
}
