//
//  SimpleListView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/10/23.
//

import SwiftUI

struct Name: Identifiable {
    var id: UUID {
        UUID()
    }
    
    let name: String
}

struct SimpleListView: View {
    
    let names: [Name]
    
    var body: some View {
        List(names) { name in
            Text(name.name)
                .frame(height: 100)
                .onAppear{
                    print(name.name)
                }
        }
    }
}

struct NameListProvider {
    static func getNames() -> [Name] {
        var names: [Name] = []
        
        for i in 1...1000 {
            names.append(Name(name: "Name : \(i)"))
        }
        
        return names
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        let names = NameListProvider.getNames()
        SimpleListView(names: names)
    }
}
