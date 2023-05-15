//
//  APICaller.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 12.05.2023.
//

import Foundation

final class APICaller {
    let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=Q9p8e1NEN7xDMWpxJH75mozCsuRxoyXS")
    let session = URLSession.shared
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=Q9p8e1NEN7xDMWpxJH75mozCsuRxoyXS")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[NewsResults], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(News.self, from: data)
                    print("Articles: \(result.results!.count)")
                    completion(.success(result.results!))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

// Models

/*struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let section: String
    let abstract: String
    let url: String
    let multimedia: [String]
}

struct Source: Codable {
    let name: String
}
*/
