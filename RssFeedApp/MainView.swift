//
//  MainView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: RssFeedsViewModel
    @StateObject private var appEnvironment = AppEnvironment.shared
    
    init() {
        _viewModel = StateObject(wrappedValue: .init())
    }
    
    var body: some View {
        TabView {
            RssFeedsView()
                .onAppear { viewModel.showSavedFeeds = false }
                .tabItem {
                    Label("New", systemImage: "newspaper")
                }
            
            RssFeedsView()
                .onAppear { viewModel.showSavedFeeds = true }
                .badge(viewModel.savedFeeds.count)
                .tabItem {
                    Label("Saved", systemImage: "square.and.arrow.down.fill")
                }
        }
        .preferredColorScheme(appEnvironment.useDarkMode ? .dark : .light)
        .environmentObject(viewModel)
        .environmentObject(appEnvironment)
        .tint(.indigo)
    }
}

#Preview {
    MainView()
}
