//
//  ViewFactory.swift
//  SearchPlaces
//
//  Created by Hari Bista on 10/10/21.
//

import Foundation
import SwiftUI

enum ViewType: Hashable {
    case contentView
    case menuView
    case loginView
    case placesListView
    case detailView
    case placeDetailView(data: PlacesListCellData)
    case webview(title: String? = nil, url: URL)
    case accountView
}

struct ViewFactory {
    
    static func getViewFor(viewType: ViewType) -> some View {
        
        var destinationView: any View
        
        switch viewType {
        case .contentView:
            destinationView = Self.getContentView()
        case .menuView:
            destinationView = Self.getMenuView()
        case .loginView:
            destinationView = Self.getLoginView()
        case .placesListView:
            destinationView = Self.getPlacesListView()
        case .placeDetailView(let data):
            destinationView = Self.getPlaceDetailView(data: data)
        case .detailView:
            destinationView = Self.getDetailView()
        case .webview(let title, let url):
            destinationView = Self.getWebview(title: title, url: url)
        case .accountView:
            destinationView = Self.getAccountView()
        }
        
        return destinationView.asAnyView()
    }
}
