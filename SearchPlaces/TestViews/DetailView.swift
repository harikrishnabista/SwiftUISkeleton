//
//  DetailView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/17/24.
//

import SwiftUI

struct DetailView: View {
    
    let url = URL(string: "https://www.google.com/")
    
    var body: some View {
        VStack {
            if let url = url {
                SwiftUIWebView(url: url)
            }
        }
        .navigationTitle("Website")
    }
}

#Preview {
    
    
    
    NavigationView {
        DetailView()
    }
}
