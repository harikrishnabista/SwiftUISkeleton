//
//  ViewBuilderPracticeView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/18/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CardViewContainer: View {
    var body: some View {
        VStack(spacing: 20) {
            CardView {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
            
            CardView {
                VStack {
                    Text("SwiftUI")
                        .font(.title)
                        .bold()
                    Text("ViewBuilder Example")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
}


#Preview {
    CardViewContainer()
}
