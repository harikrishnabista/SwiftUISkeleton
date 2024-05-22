//
//  PlacesListViewModel.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import Foundation
import Combine

class PlacesListViewModel: ObservableObject {

    var loadingVM: LoadingSpinnerViewModel?
    
    let title = "Google Places"
    
    let retryButtonTitle = "Retry"
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var placesRepo: PlacesRepositoryProtocol
    private var local: LocalStorageProtocol
    init(
        placesRepo: PlacesRepositoryProtocol,
        local: LocalStorageProtocol
    ) {
        self.placesRepo = placesRepo
        self.local = local
        
        setupSearchTextBinding()
        
        publishListData()
        
        searchText = "Restaurants"
    }
    
    func onViewAppear(loadingVM: LoadingSpinnerViewModel) {
        self.loadingVM = loadingVM
    }
    
    func onRetry() {
        errorMessage = nil
        searchText = ""
    }
    
    @Published var searchText: String = ""
    private func setupSearchTextBinding() {
        $searchText
            .debounce(for: 1.0, scheduler: RunLoop.main)
            .sink { [weak self] newText in
                guard newText.count > 2 else { return }
                self?.getPlaces()
            }
            .store(in: &cancellableSet)
    }
    
    private var places: Places? {
        didSet {
            publishListData()
        }
    }
    
    @Published var listData: [PlacesListCellData] = []
    private func publishListData() {
        guard let newListData = places?.results.map({
            PlacesListCellData(
                name: $0.name,
                iconUrlString: $0.icon,
                rating: $0.rating,
                ratingCount: $0.userRatingsTotal,
                address: $0.formattedAddress
            )
        }) else { return }
        
        listData = newListData
    }
    
    private func getPlaces() {
        
        showLoading()
        
        placesRepo.getPlacesList(searchText: searchText) { (result: Result<Places, NetworkServiceError>) in
            DispatchQueue.main.async { [weak self] in
                
                guard let self = self else { return }
                
                hideLoading()
                
                switch result {
                case .success(let places):
                    self.places = places
                case .failure(let error):
                    self.updateErrorView(with: error.message)
                }
                
            }
        }
    }
    
    @Published var errorMessage: String?
    private func updateErrorView(with message: String) {
        errorMessage = message
    }
    
    private func showLoading() {
        loadingVM?.isLoading = true
    }
    
    private func hideLoading() {
        loadingVM?.isLoading = false
    }
}
