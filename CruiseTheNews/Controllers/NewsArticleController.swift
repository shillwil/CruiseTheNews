//
//  NewsArticleController.swift
//  CruiseTheNews
//
//  Created by Johnny Hicks on 12/13/18.
//  Copyright © 2018 Johnny Hicks. All rights reserved.
//

import UIKit

class NewsArticleController {
    static let shared = NewsArticleController()
    
    // MARK: Properties
    let baseURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=87a5b3918d6e49039c24e4c3a7bf07ae")
    
    var articles: [NewsArticle] = []
    
    // MARK: Methods
    func fetchArticles(completion: @escaping ([NewsArticle]?) -> Void) {
        guard let url = baseURL else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
                if let error = error {
                    NSLog("There was an error fetching news articles: %@", error.localizedDescription)
                }
                
                guard let articleData = data else {
                    completion(nil);
                    return }
                
                let newsArticles = try JSONDecoder().decode(Articles.self, from: articleData)
                
                self.articles = newsArticles.articles
                
                completion(newsArticles.articles)
                
            } catch let error {
                print("Invalid data returned: \(error)")
                completion(nil)
                return
            }
        }.resume()
    }
}
