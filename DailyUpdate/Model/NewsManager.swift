//
//  NewsManager.swift
//  DailyUpdate
//
//  Created by Jigmet stanzin Dadul on 24/06/23.
//

import Foundation

protocol NewsManagerDelegate{
    func didfetchArticles(articles: [Article])
    func didEndWithError(error: Error)
}

struct NewsManager{
    
    var delegate: NewsManagerDelegate?
    let urlString:String = "https://newsapi.org/v2/top-headlines?"
    let apiKey:String = "&apiKey="
    

    func fetchArticles(countryCode: String ){
        print("\(urlString)country=\(countryCode)\(apiKey)")
        performRequest("\(urlString)country=\(countryCode)\(apiKey)")
        print("\(urlString)country=\(countryCode)\(apiKey)")
    }
    func performRequest(_ urlString: String){
        print("performing")
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print("error")
                    self.delegate?.didEndWithError(error: error!)
                }
                
                if let safeData = data{
                    if let news = parseJSON(safeData){
                        self.delegate?.didfetchArticles(articles: news)
//                        for new in news{
//                            print(new.title)
//                            print("")
//                        }
                        
                    }else{
                        print("returned nil")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ newsData: Data)->[Article]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do{
            let decodeData = try decoder.decode(NewsData.self, from: newsData)
            let articleList:[Article] = decodeData.articles
            print("Parsing status:\(decodeData.status)\n")
            
            return articleList
        }catch{
            delegate?.didEndWithError(error: error)
            print(error)
            return nil
        }
    }
    
    func downloadImage(from url: URL){
        
    }
}
