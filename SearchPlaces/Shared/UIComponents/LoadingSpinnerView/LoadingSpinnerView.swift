//
//  LoadingSpinnerView.swift
//  SearchPlaces
//
//  Created by Kiavash Faisali on 11/9/22.
//

import SwiftUI

struct LoadingSpinnerView: View {
    
    @StateObject var vm: LoadingSpinnerViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            ProgressView()
                .scaleEffect(2)
                .tint(Color.white)
            
            Text("Loading...")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(
            Color.black.opacity(0.8)
        )
        .opacity(vm.isLoading ? 1 : 0)
    }
}

#Preview {
    LoadingSpinnerView(vm: LoadingSpinnerViewModel(isLoading: true))
}
