//
//  PlacesRepository.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/16/24.
//

import Foundation

protocol PlacesRepositoryProtocol {
    func getPlacesList(
        searchText: String,
        completion: @escaping (Result<Places, NetworkServiceError>) -> Void
    )
}

struct PlacesRepository : PlacesRepositoryProtocol {
    
    private let apiCaller: NetworkServiceProtocol
    init(apiCaller: NetworkServiceProtocol) {
        self.apiCaller = apiCaller
    }
    
    func getPlacesList(
        searchText: String,
        completion: @escaping (Result<Places, NetworkServiceError>) -> Void
    ) {
        apiCaller.call(
            getApiConfFor(searchText: searchText),
            completion
        )
    }

    private let baseUrl = "https://maps.googleapis.com"
    
    private var urlPath: String {
        baseUrl + "/maps/api/place/textsearch/json"
    }
    
    private let location = "\(DistanceCalculater.userLocation.coordinate.latitude), \(DistanceCalculater.userLocation.coordinate.longitude)"
    
}

extension PlacesRepository {
    private func getApiConfFor(searchText: String) -> ApiConfiguration {
        ApiConfiguration(
            urlPath: urlPath,
            parameters: [
                URLQueryItem(name: "key", value: "AIzaSyBPUsycPYmVE2Nkccw7z0IliWM_i80YzZQ"),
                URLQueryItem(name: "query", value: searchText),
                URLQueryItem(name: "location", value: location)
            ],
            method: .post,
            body: Post(postId: "123")
        )
    }
}
