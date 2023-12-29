//
//  OptionView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import SwiftUI

struct OptionView: View {
    @EnvironmentObject private var appEnvironment: AppEnvironment

    var body: some View {
        VStack(spacing: 15) {
            Toggle("Use safari to open RSS items", isOn: $appEnvironment.useSafari).bold()
            Toggle("Use dark mode", isOn: $appEnvironment.useDarkMode).bold()
        }
        .padding()
        .preferredColorScheme(appEnvironment.useDarkMode ? .dark : .light)
    }
}

#Preview {
    OptionView()
}
