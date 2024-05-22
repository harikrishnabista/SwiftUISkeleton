//
//  VerticalSpace.swift
//
//
//  Created by Hari Krishna Bista on 1/25/24.
//

import SwiftUI

public struct VerticalSpace: View {
    
    private let height: CGFloat
    
    public init(height: CGFloat) {
        self.height = height
    }
    
    public var body: some View {
        Spacer()
            .frame(width: 0, height: height)
    }
}

#Preview {
    VStack {
        
        VerticalSpace(height: 20)
        
    }
    .padding()
}
