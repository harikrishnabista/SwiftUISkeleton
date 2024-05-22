//
//  LoginRepository.swift
//  LoginRepository
//
//  Created by Hari Krishna Bista on 7/3/23.
//

import Foundation

struct LoginRequest: Encodable {
    let userName: String
    let password: String
}

struct LoginToken: Decodable {
    let token: String
}

struct UserDetails: Decodable {
    let firstName: String
    let lastName: String
    let email: String
    let profileImageUrl: String
}

protocol LoginRepositoryProcotol {
    func login(
        userName: String,
        password: String,
        completion: @escaping (Bool, String?) -> Void
    )
}

class LoginRepository : LoginRepositoryProcotol {
    
    private let network: NetworkServiceProtocol
    private let local: LocalStorageProtocol
    init(
        network: NetworkServiceProtocol,
        local: LocalStorageProtocol
    ) {
        self.network = network
        self.local = local
    }
    
    func login(
        userName: String,
        password: String,
        completion: @escaping (Bool, String?) -> Void
    ) {
        
        let config = getApiConfig(username: userName, password: password)
        
        network.call(config) { (result: Result<LoginToken, NetworkServiceError>) in
            
            switch result {
            case .success(let loginToken):
                
                self.local.saveToKeychain(username: userName, password: password)
                self.local.save(token: loginToken.token)
                
                completion(true, "Login succesful.")
                
            case .failure(let error):
                completion(false, error.message)
            }
            
        }
    }
    
    private let baseUrl = "https://fiskerinc.com"
    private let endPoint = "/login"
    
    private func getApiConfig(username: String, password: String) -> ApiConfiguration {
        ApiConfiguration(
            urlPath: baseUrl + endPoint,
            parameters: [],
            method: .post,
            body: LoginRequest(userName: username, password: password)
        )
    }
}
