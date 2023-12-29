//
//  RssFeedView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 26.12.2023..
//

import SwiftUI
import AlertToast

struct RssFeedsView: View {
    @EnvironmentObject private var viewModel: RssFeedsViewModel
    @EnvironmentObject private var appEnvironment: AppEnvironment
    
    @State private var presentAddView: Bool
    @State private var didPressOption: Bool
    
    init() {
        _presentAddView = State(wrappedValue: false)
        _didPressOption = State(wrappedValue: false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.rssFeeds, id: \.self) { feed in
                    RssFeedCellView(feed: feed)
                }
                .environmentObject(viewModel)
                .listStyle(.plain)
            }
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .background(
                BackgroundView(
                    isListEmpty: viewModel.rssFeeds.isEmpty,
                    title: viewModel.backgroundTitle)
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        didPressOption.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .foregroundStyle(.indigo)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                PlusButtonView(didPressPlus: $presentAddView)
                    .padding()
            }
            .toast(isPresenting: $viewModel.toastManager.isShowingSuccessToast, duration: 3) {
                AlertToast(displayMode: .banner(.pop), type: .complete(.green), title: viewModel.toastManager.successToastMessage)
            }
            .toast(isPresenting: $viewModel.toastManager.isShowingLoadingToast, duration: 3) {
                AlertToast(type: .loading)
            }
            .toast(isPresenting: $viewModel.toastManager.isShowingErrorToast, duration: 4) {
                AlertToast(displayMode: .banner(.pop), type: .error(.red), title: viewModel.toastManager.errorToastMessage, style: .style(titleColor: .red,titleFont: .body, subTitleFont: .body))
            }
            .onAppear {
                self.didPressOption = false
                self.presentAddView = false
            }
        }
        .sheet(isPresented: $presentAddView, content: {
            AddFeedView()
                .environmentObject(viewModel)
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(150)])
        })
        .sheet(isPresented: $didPressOption, content: {
            OptionView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(150)])
                .environmentObject(appEnvironment)
        })
        .sheet(item: $viewModel.selectedFeed) { feed in
            RssFeedItemsView(feed: feed.rssFeed)
                .environmentObject(viewModel)
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    RssFeedsView()
}
