//
//  PlaceListView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import SwiftUI

struct PlaceListView: View {
    
    @StateObject var vm: PlacesListViewModel
    
    @EnvironmentObject var loadingVM: LoadingSpinnerViewModel
    @EnvironmentObject var rootVM: ContentViewModel
    
    var body: some View {
        ZStack {
            List(vm.listData) { dataItem in
                PlacesListCell(data: dataItem)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        rootVM.path.append(.placeDetailView(data: dataItem))
                    }
            }
            .searchable(text: $vm.searchText)
            
            if let errorMessage = vm.errorMessage {
                errorView(message: errorMessage)
            }
        }
        .foregroundColor(.black)
        .navigationTitle(vm.title)
        .onAppear {
            vm.onViewAppear(loadingVM: loadingVM)
        }
    }
    
    private func errorView(message: String) -> some View {
        VStack(spacing: 20) {
            Text(message)
            
            Button(vm.retryButtonTitle) {
                vm.onRetry()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color.red)
    }
}

#Preview {
    ViewFactory.getViewFor(viewType: .placesListView)
        .environmentObject(LoadingSpinnerViewModel())
}
