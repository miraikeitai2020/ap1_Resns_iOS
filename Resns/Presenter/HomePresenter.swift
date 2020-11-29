
import Foundation

class HomePresenter{
    //let semaphore = DispatchSemaphore(value: 0)
    
    func application(completion: @escaping ( [[ArticlesQuery.Data.Article.Article?]?] ) -> Void) {
        Network.shared.apollo.fetch(query: ArticlesQuery(genre: "アニメ・漫画")) { result in
           // self.semaphore.signal()
            switch result {
                case .success(let response):
                    completion([response.data?.articles.articles])

                case .failure(let error):
                    print(error)
                }
            }
       // semaphore.wait()
        }
}
