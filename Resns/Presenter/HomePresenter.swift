
import Foundation


class HomePresenter{
    //let semaphore = DispatchSemaphore(value: 0)
    
    func application(completion: @escaping ( [[ArticlesQuery.Data.Article.Article?]?] ) -> Void) {
        //print("aaaaaa",genre)
        
        var year = UserDefaults.standard.integer(forKey: "year")
        var month = UserDefaults.standard.integer(forKey: "month")
        var genre = UserDefaults.standard.string(forKey: "genre")
        
        Network.shared.apollo.fetch(query: ArticlesQuery(genre: "\(genre ?? "アニメ・漫画")",year: year,month: month)) {
            result in
            switch result {
                case .success(let response):
                    completion([response.data?.articles.articles])

                case .failure(let error):
                    print(error)
                }
            }
        }
    
}
