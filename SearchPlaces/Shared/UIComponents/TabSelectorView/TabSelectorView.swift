//
//  TabSelectorView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/17/24.
//

import SwiftUI

struct TabSelectorView: View {
    var items: [TabSelectorItem]
    @Binding var selectedIndex: Int
    
    var selectedTitleColor: Color = Color.black
    var unselectedTitleColor: Color = Color.gray
    
    var titleFont = Font.system(.title)
    
    var underlineColor: Color = Color.orange
    var underlineViewHeight: CGFloat = 3.0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(items) { item in
                    TabSelectorItemView(
                        item: item,
                        selectedIndex: $selectedIndex,
                        selectedTitleColor: selectedTitleColor,
                        unselectedTitleColor: unselectedTitleColor,
                        titleFont: titleFont,
                        underlineColor: underlineColor,
                        underlineViewHeight: underlineViewHeight
                    )
                }
            }
            
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color.gray)
        }
    }
}

struct TabSelectorViewContainer_TestView: View {
    
    @StateObject var vm: TabSelectorViewContainer_TestViewModel
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            TabSelectorView(
                items: vm.items,
                selectedIndex: $vm.selectedIndex
            )
            .frame(height: 60)
            
            Text(vm.details)
            
            Spacer()
        }

    }
}

class TabSelectorViewContainer_TestViewModel : ObservableObject {
    
    @Published var selectedIndex: Int = 0
    
    var details: String {
        "Selected item: \(items[selectedIndex].title), index: \(selectedIndex)"
    }
    
    @Published var items = [
        TabSelectorItem(index: 0, title: "First"),
        TabSelectorItem(index: 1, title: "Second"),
        TabSelectorItem(index: 2, title: "Third")
    ]
    
}

#Preview {
    TabSelectorViewContainer_TestView(vm: TabSelectorViewContainer_TestViewModel())
}
