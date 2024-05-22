//
//  extension.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import SwiftUI

public extension View {
    
    func asAnyView() -> AnyView {
        return AnyView(self)
    }
    
}

extension Encodable {
    var jsonEncodedData: Data? {
        try? JSONEncoder().encode(self)
    }
}
