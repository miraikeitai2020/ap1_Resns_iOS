
import Foundation

class HomePresenter{
    
    func application(completion: @escaping ( [[ArticlesQuery.Data.Article.Article?]?] ) -> Void) {
        Network.shared.apollo.fetch(query: ArticlesQuery(genre: "アニメ・漫画")) { result in
                
            switch result {
                case .success(let response):
                    completion([response.data?.articles.articles])

                case .failure(let error):
                    print(error)
                }
            }
        }
}
