//
//  Extensions+String.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

extension String {
    var trimHTMLTag: String {
        return replacingOccurrences(of:"<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    var trimWhiteAndSpace: String {
        return replacingOccurrences(of: "\n", with: "")
    }
}
