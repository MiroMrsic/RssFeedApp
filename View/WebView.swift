//
//  WebView.swift
//  RssFeedApp
//
//  Created by Miroslav Mrsic on 29.12.2023..
//

import SwiftUI
import WebKit

struct Webview : UIViewRepresentable {
    var webView: WKWebView = WKWebView()
    let urlString: String
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: Webview
        
        init(_ parent: Webview) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

extension Webview {
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.scrollView.bounces = false
        
        if let url = URL(string: urlString) {
            self.webView.load(URLRequest(url: url))
        }
        
        return self.webView
    }
}
