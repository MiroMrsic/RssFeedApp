//
//  DBM.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import Foundation
import RealmSwift

class DBM {
    static let DB_VERSION: UInt64 = 1
    
    static func setup() {
        let path = "RssFeedApp"
        var config = Realm.Configuration.defaultConfiguration
        
        //path setup
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(path)
        config.fileURL!.appendPathExtension("realm")
        
        config.deleteRealmIfMigrationNeeded = true
        
        //set schema version for versioning purposes
        config.schemaVersion = DB_VERSION
        Realm.Configuration.defaultConfiguration = config
    }
}
