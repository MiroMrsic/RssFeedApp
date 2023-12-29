//
//  IndigoTextFieldStyle.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import Foundation
import SwiftUI

struct IndigoTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.indigo, lineWidth: 1)
            )
            .padding(10)
    }
}
