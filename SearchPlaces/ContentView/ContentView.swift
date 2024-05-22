//
//  LoginView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var rootVM: ContentViewModel
    
    @StateObject var loadingVM: LoadingSpinnerViewModel
    
    var body: some View {
        NavigationStack(path: $rootVM.path) {
            ZStack {
                
                ViewFactory.getViewFor(viewType: .placesListView)
                
                LoadingSpinnerView(vm: loadingVM)
                
            }
            .navigationDestination(for: ViewType.self) { viewType in
                ViewFactory.getViewFor(viewType: viewType)
            }
            .sheet(isPresented: $rootVM.isShowLoginView) {
                ViewFactory.getViewFor(viewType: .loginView)
            }
            .toolbar {
                menuToolbarItem
            }
        }
        .foregroundColor(.black)
        .environmentObject(rootVM)
        .environmentObject(loadingVM)
    }
    
    private var menuToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                rootVM.path.append(.menuView)
            } label: {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            }
        }
    }
}

#Preview {
    ViewFactory.getViewFor(viewType: .contentView)
}

//#Preview {
//    let vm = PlacesListViewModel(
//        placesRepo: PlacesRepository(apiCaller: NetworkService())
//    )
//    vm.searchText = "Bar"
//
//    return PlacesListView(vm: vm)
//}
//
//#Preview {
//    let vm = PlacesListViewModel(
//        placesRepo: PlacesRepository(apiCaller: NetworkService())
//    )
//    vm.searchText = "Restaurants"
//
//    return PlacesListView(vm: vm)
//}
//
//#Preview {
//    let vm = PlacesListViewModel(
//        placesRepo: PlacesRepository(apiCaller: NetworkService())
//    )
//    vm.errorMessage = "Something gone wrong"
//
//    return PlacesListView(vm: vm)
//}
//
//#Preview {
//    let vm = PlacesListViewModel(
//        placesRepo: PlacesRepository(apiCaller: NetworkService())
//    )
//    vm.loadingVM.isLoading = true
//
//    return PlacesListView(vm: vm)
//}

