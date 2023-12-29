//
//  RssFeedItemDTO.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

class RssFeedItemDTO: Identifiable {
    var id: UUID
    var rssFeedItem: RssFeedItem
    
    init(id: UUID = .init(), rssFeedItem: RssFeedItem) {
        self.id = id
        self.rssFeedItem = rssFeedItem
    }
}
