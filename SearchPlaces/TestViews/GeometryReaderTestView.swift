//
//  SwiftUIView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/17/24.
//

import SwiftUI

struct GeometryReaderTestView: View {
    var body: some View {
        
        VStack {
                
            VStack {
                GeometryReader { geometry in
                    Text("\(geometry.size.height)")
                }
            }
            .border(Color.black)
            
            Text("here")
            
            Text("here")
            
            Text("here")
            
            Spacer()
            
        }
        
    }
}

#Preview {
    GeometryReaderTestView()
}
