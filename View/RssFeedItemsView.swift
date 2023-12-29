//
//  RssFeedItemsView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 28.12.2023..
//

import SwiftUI

struct RssFeedItemsView: View {
    @EnvironmentObject
    private var viewModel: RssFeedsViewModel
    
    let feed: RssFeed
    
    var body: some View {
        VStack {
            List(viewModel.rssFeedItems, id: \.self) { item in
                RssFeedItemCell(item: item)
            }
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.getRssFeed(
                from: feed.urlString,
                getRssFeedItems: true,
                callback: {}
            )
        }
        .onDisappear {
            self.viewModel.selectedFeed = nil
            self.viewModel.selectedRssItem = nil
        }
        .sheet(item: $viewModel.selectedRssItem) { item in
            if AppEnvironment.shared.useSafari, let url = URL(string: item.rssFeedItem.urlString) {
                SafariView(url: url)
            } else {
                self.getWebView(urlString: item.rssFeedItem.urlString)
            }
        }
    }
}

extension RssFeedItemsView {
    private func getWebView(urlString: String) -> some View {
        NavigationView {
            Webview(urlString: urlString)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            viewModel.selectedRssItem = nil
                        } label: {
                            Text("Done")
                                .foregroundStyle(.indigo)
                                .bold()
                        }
                    }
                }
        }
    }
}

//#Preview {
//    RssFeedItemsView()
//}
