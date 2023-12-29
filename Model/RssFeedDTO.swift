//
//  RssFeedDTO.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

class RssFeedDTO: Identifiable {
    var id: UUID
    var rssFeed: RssFeed
    
    init(id: UUID = .init(), rssFeed: RssFeed) {
        self.id = id
        self.rssFeed = rssFeed
    }
}
