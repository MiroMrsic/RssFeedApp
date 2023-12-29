//
//  FeedView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import SwiftUI

struct RssFeedCellView: View {
    @EnvironmentObject
    private var viewModel: RssFeedsViewModel
    
    let feed: RssFeed
    
    var body: some View {
        Button(action: {
            viewModel.selectedFeed = .init(rssFeed: feed)
        }, label: {
            HStack(spacing: 10) {
                if let url = URL(string: feed.imageString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                            .frame(width: 50, height: 50, alignment: .center)
                        
                    } placeholder: {
                        ProgressView()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center) {
                        Text(feed.title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        
                        Spacer()
                        
                        Button {
                            viewModel.makeOrRemoveFavorite(feed)
                        } label: {
                            Image(systemName: "star.fill")
                        }
                        .foregroundStyle(feed.isFavorite ? .yellow : .gray)
                    }
                    
                    Text(feed.desc.trimHTMLTag.trimWhiteAndSpace)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(10)
        })
        .listRowSeparator(.visible)
        .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
        .swipeActions(allowsFullSwipe: false) {
            Button(role: .destructive) {
                viewModel.deleteFeed(feed)
            } label: {
                Image(systemName: "trash.fill")
            }
            .tint(.red)
            
            Button {
                viewModel.saveOrReturnFeed(feed)
            } label: {
                Image(systemName: getImageName())
            }
            .tint(.indigo)
        }
    }
}

extension RssFeedCellView {
    func getImageName() -> String {
        return self.feed.isArchive ?
        "arrow.uturn.down.square.fill" : "arrow.down.to.line.square.fill"
    }
}

#Preview {
    RssFeedCellView(feed: .init())
}
