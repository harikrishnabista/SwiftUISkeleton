//
//  ViewFactory+extension.swift
//  SearchPlaces
//
//  Created by Hari Bista on 10/10/21.
//

import Foundation
import SwiftUI

extension ViewFactory {
    
    static func getContentView() -> ContentView {
        ContentView(
            rootVM: ContentViewModel(local: LocalStorage()),
            loadingVM: LoadingSpinnerViewModel()
        )
    }
    
    static func getMenuView() -> MenuView {
        MenuView()
    }
    
    static func getLoginView() -> LoginView {
        LoginView(
            vm: LoginViewModel(
                validator: LoginValidator(),
                repository: LoginRepository(
                    network: GlobalSetting.shared.getNetworkService(),
                    local: LocalStorage()
                )
            )
        )
    }
    
    static func getPlacesListView() -> PlaceListView {
        PlaceListView(
            vm: PlacesListViewModel(
                placesRepo: PlacesRepository(apiCaller: NetworkService()),
                local: LocalStorage()
            )
        )
    }
    
    static func getPlaceDetailView(data: PlacesListCellData) -> PlaceDetailView {
        PlaceDetailView(data: data)
    }
    
    static func getDetailView() -> DetailView {
        DetailView()
    }
    
    static func getWebview(title: String? = nil, url: URL) -> SwiftUIWebView {
        SwiftUIWebView(title: title, url: url)
    }
    
    static func getAccountView() -> AccountView {
        AccountView()
    }
}
