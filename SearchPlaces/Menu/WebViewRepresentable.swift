//
//  WebViewRepresentable.swift
//  Fisker
//
//  Created by Kiavash Faisali on 9/21/22.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: View {
    
    private let title: String?
    private let url: URL
    
    init(
        title: String? = nil,
        url: URL
    ) {
        self.title = title
        self.url = url
    }
    
    var body: some View {
        WebView(url: self.url)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationTitle(title ?? "")
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct WebView: UIViewRepresentable {
    
    var url: URL
    
    let wkWebView = WKWebView()
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        wkWebView.navigationDelegate = context.coordinator
        wkWebView.scrollView.delegate = context.coordinator
        wkWebView.load(URLRequest(url: url))
        return wkWebView
        
    }
    
    func updateUIView(_ uiView: WKWebView,
                      context: UIViewRepresentableContext<WebView>) {}
    
}

class WebViewCoordinator: NSObject, WKNavigationDelegate, UIScrollViewDelegate {
    
    let webView: WebView

    init(_ webView: WebView) {
        self.webView = webView
    }
    
}


