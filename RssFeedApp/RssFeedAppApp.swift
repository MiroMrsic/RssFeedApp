//
//  RssFeedAppApp.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import SwiftUI

@main
struct RssFeedAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    DBM.setup()
                    AppEnvironment.shared.useDarkMode = true
                }
        }
    }
}
