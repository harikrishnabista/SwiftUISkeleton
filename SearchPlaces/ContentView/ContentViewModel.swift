//
//  ContentViewModel.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/7/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var path: [ViewType] = []
    @Published var isShowLoginView = false

    private var local: LocalStorageProtocol
    init(local: LocalStorageProtocol) {
        self.local = local
        publishIsShowLoginView()
    }
    
    private func publishIsShowLoginView() {
        local.clearToken()
        isShowLoginView = !local.isUserLoggedIn
    }
    
}
