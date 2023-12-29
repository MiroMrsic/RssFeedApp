//
//  PlusButtonView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import SwiftUI

struct PlusButtonView: View {
    @Binding var didPressPlus: Bool
    
    var body: some View {
        Button(action: {
            self.didPressPlus.toggle()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(10)
        })
        .foregroundStyle(.indigo)
    }
}

#Preview {
    PlusButtonView(didPressPlus: .constant(false))
}
