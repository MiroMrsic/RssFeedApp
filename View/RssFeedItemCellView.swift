//
//  RssFeedItemCell.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import SwiftUI

struct RssFeedItemCell: View {
    @EnvironmentObject
    var viewModel: RssFeedsViewModel
    
    let item: RssFeedItem
    
    var body: some View {
        Button(action: {
            viewModel.selectedRssItem = .init(rssFeedItem: item)
        }, label: {
            HStack(spacing: 10) {
                if let url = URL(string: item.imageString) {
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
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    Text(item.desc.trimHTMLTag.trimWhiteAndSpace)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(10)
        })
        .listRowSeparator(.visible)
        .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

#Preview {
    RssFeedItemCell(item: .init())
}
