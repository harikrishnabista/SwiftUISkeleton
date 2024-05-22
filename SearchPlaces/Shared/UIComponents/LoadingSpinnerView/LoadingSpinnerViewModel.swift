//
//  LoadingSpinnerViewModel.swift
//  SearchPlaces
//
//  Created by Kiavash Faisali on 11/9/22.
//

import SwiftUI

class LoadingSpinnerViewModel: ObservableObject {
    @Published var isLoading = false

    init(isLoading: Bool = false) {
        self.isLoading = isLoading
    }
}
