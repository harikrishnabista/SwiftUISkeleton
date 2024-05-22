//
//  MockNetworkService.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 3/15/24.
//

import Foundation

struct MockNetworkService: NetworkServiceProtocol {
    func call<T: Decodable>(
        _ config: any APIConfiguration,
        _ completion: @escaping (Result<T, NetworkServiceError>) -> Void
    ) -> URLSessionDataTask? {
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: TimeInterval(Int.random(in: 2...5)))

            let jsonString: String
            
            if T.self == LoginToken.self {
                jsonString = JsonStorage.loginToken
            } else if T.self == UserDefaults.self {
                jsonString = JsonStorage.userDetails
            } else {
                jsonString = ""
            }
            
            if let obj = try? JSONDecoder().decode(T.self, from: Data(jsonString.utf8)) {
                completion(Result.success(obj))
            } else {
                let error = NetworkServiceError(message: "Parse Error: MockNetworkService")
                printError(error)
                completion(Result.failure(error))
            }
        }

        return nil
    }

}

