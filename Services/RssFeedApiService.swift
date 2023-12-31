//
//  RssFeedApiService.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import Foundation
import Combine
import FeedKit

class ApiService {
    static func fetchNewRSS(url: URL,
                     completionHandler: @escaping ((Result<Feed, Error>) -> Void)) {
        
        let parser = FeedParser(URL: url)
        parser.parseAsync(queue: DispatchQueue.global()) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let feed):
                    completionHandler(.success(feed))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
}
