//
//  SearchPresenter.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/11/09.
//

import Foundation

class SearchPresenter{
    
    func application(completion: @escaping ([[ArticlesFromTagQuery.Data.ArticlesFromTag.Article?]?]) -> Void) {
        
        var search = UserDefaults.standard.string(forKey: "Search")
        Network.shared.apollo.fetch(query: ArticlesFromTagQuery(tag: "\(search ?? "BTS")")) { result in
                switch result {
                case .success(let response):
                    completion([response.data?.articlesFromTag.articles])

                case .failure(let error):
                    print(error)
                }
            }
        }
}
