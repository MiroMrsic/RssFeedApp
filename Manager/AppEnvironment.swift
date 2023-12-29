//
//  AppEnvironment.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation

class AppEnvironment: ObservableObject {
    static let shared = AppEnvironment()
    
    @Published var useSafari: Bool {
        didSet {
            UserDefaults.standard.set(useSafari, forKey: "useSafari")
        }
    }
    
    @Published var useDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(useSafari, forKey: "useDarkMode")
        }
    }
    
    private init() {
        self.useSafari = UserDefaults.standard.bool(forKey: "useSafari")
        self.useDarkMode = UserDefaults.standard.bool(forKey: "useDarkMode")
    }
}
