//
//  BackgroundView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 27.12.2023..
//

import SwiftUI

struct BackgroundView: View {
    var isListEmpty: Bool = false
    var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            if isListEmpty {
                Image(systemName: "newspaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text(title)
                    .font(.system(size: 22))
            }
        }
        .foregroundStyle(.gray)
    }
}

#Preview {
    BackgroundView(title: "News")
}
