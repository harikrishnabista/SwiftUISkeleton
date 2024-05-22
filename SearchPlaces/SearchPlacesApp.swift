//
//  SearchPlacesApp.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/2/23.
//

import SwiftUI

@main
struct SearchPlacesApp: App {
    var body: some Scene {
        WindowGroup {
            ViewFactory.getViewFor(viewType: .contentView)
                .preferredColorScheme(.light)
        }
    }
}


