//
//  DistanceCalculater.swift
//  SearchPlaces
//
//  Created by Hari Bista on 10/10/21.
//

import Foundation

protocol LocalStorageProtocol {
    func saveToKeychain(username: String, password: String)
    func save(token: String)
    func getToken() -> String?
    func clearToken()
    
    var isUserLoggedIn: Bool { get }
}


class LocalStorage : LocalStorageProtocol {
    func saveToKeychain(username: String, password: String) {
        // save to keychain implementation
    }
    
    static var tokenUserDetaultsKey = "com.fiskerinc.tokenUserDetaultsKey"
    
    func save(token: String) {
        UserDefaults.standard.set(token, forKey: Self.tokenUserDetaultsKey)
    }
    
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: Self.tokenUserDetaultsKey)
    }
    
    var isUserLoggedIn: Bool {
        UserDefaults.standard.string(forKey: Self.tokenUserDetaultsKey) != nil
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: Self.tokenUserDetaultsKey)
    }
}
