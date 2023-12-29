//
//  RSS.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import Foundation
import RealmSwift
import FeedKit

public final class RssFeed: Object {
    @Persisted(primaryKey: true) var uuid: UUID = .init()
    
    @Persisted var desc: String
    @Persisted var title: String
    @Persisted var urlString: String
    @Persisted var isArchive: Bool
    @Persisted var isFavorite: Bool
    @Persisted var isDeleted: Bool
    @Persisted var imageString: String
    @Persisted var createdTime: Date
    
    static func create(title: String = "", desc: String = "", urlString: String = "", imageString: String = "", createdTime: Date = Date()) -> RssFeed {
       let item = RssFeed()
       item.title = title
       item.desc = desc
       item.urlString = urlString
       item.createdTime = createdTime
       item.imageString = imageString
       return item
     }
}
