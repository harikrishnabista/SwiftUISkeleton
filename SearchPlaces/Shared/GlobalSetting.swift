//
//  GlobalSetting.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import Foundation

struct GlobalSetting {
    
    static var shared = GlobalSetting()
    
    private init() {
        
    }
    
    var isMock = true
    
    func getNetworkService() -> NetworkServiceProtocol {
        if isMock {
            return MockNetworkService()
        }
        
        return NetworkService()
    }
    
}
