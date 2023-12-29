//
//  NetworkError.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

enum NetworkError: Error {
    case noData
    case databaseError
    case errorMessage(String)
}
