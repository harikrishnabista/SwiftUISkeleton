//
//  MenuView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var rootVM: ContentViewModel
    
    let menuItems: [MenuItemData] = [
        MenuItemData(title: "Account", url: nil),
        MenuItemData(title: "Contact us", url: URL(string: "https://www.google.com/")),
        MenuItemData(title: "Terms and Conditions", url: URL(string: "https://www.google.com/")),
        MenuItemData(title: "FAQ", url: URL(string: "https://www.google.com/")),
        MenuItemData(title: "Sign Out", url: nil)
    ]
    
    var body: some View {
        
        VStack(spacing: 20) {
            ForEach(menuItems) { item in
                HStack {
                    Text(item.title)
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    VerticalSpace(height: 1)
                        .background(Color.red)
                }
                .onTapGesture {
                    if let url = item.url {
                        rootVM.path.append(.webview(title: item.title, url: url))
                    }
                    
                    if item.title == "Account" {
                        rootVM.path.append(.accountView)
                    }
                }
            }
            
            Spacer()
        }
        .padding(24)
        .toolbar { toolbar }
        .navigationBarBackButtonHidden()
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                rootVM.path.removeLast()
            } label: {
                Image("backButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .background(.clear)
            }
        }
    }
}

struct MenuItemData : Identifiable {
    let id = UUID()
    let title: String
    let url: URL?
}

struct MenuContainerView : View {
    
    @StateObject var rootVM = ContentViewModel(local: LocalStorage())
    
    var body: some View {
        NavigationStack(path: $rootVM.path) {
            VStack {
                MenuView()
                    .environmentObject(rootVM)
            }
            .navigationDestination(for: ViewType.self) { viewType in
                ViewFactory.getViewFor(viewType: viewType)
            }
        }
        
    }
}

struct AccountView : View {
    var body: some View {
        Text("Account View")
    }
}

#Preview {
    MenuContainerView()
}

