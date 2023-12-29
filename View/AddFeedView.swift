//
//  AddFeedView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import SwiftUI
import AlertToast

struct AddFeedView: View {
    @EnvironmentObject var viewModel: RssFeedsViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var urlString: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("URL", text: $urlString, axis: .vertical)
                    .keyboardType(.URL)
                    .textFieldStyle(IndigoTextFieldStyle())
            }
            .padding(10)
            .navigationTitle("Enter RSS feed URL")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.getFeed(from: urlString) {
                            dismiss()
                        }
                    } label: {
                        Text("Add")
                            .bold()
                            .foregroundStyle(.indigo)
                    }
                    .disabled(viewModel.toastManager.isShowingLoadingToast)
                }
            }
            .toast(isPresenting: $viewModel.toastManager.isShowingErrorToast, duration: 4) {
                AlertToast(displayMode: .banner(.pop), type: .error(.red), title: viewModel.toastManager.errorToastMessage, style: .style(titleColor: .red,titleFont: .body, subTitleFont: .body))
            }
        }
    }
}

#Preview {
    AddFeedView()
}
