//
//  PlacesListCell.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/7/23.
//

import SwiftUI

struct PlacesListCell: View {
    
    var data: PlacesListCellData
    
    var body: some View {
        HStack {
            
            imageView
            
            LazyVStack(alignment: .leading, spacing: 8) {
                
                Text(data.name)
                    .bold()
                
                HStack {
                    Text(data.ratingDisplayName)

                    HStack {
                        ForEach(0..<Int(data.rating), id: \.self) { i in
                            Image("starFullFilled")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color.green)
                        }
                    }
                    
                    Text("by: \(data.ratingCount)")
                }
                
                Text(data.address)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(20)
        
    }
    
    private var imageView: some View {
        VStack {
            AsyncImage(url: data.iconUrl) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
        }
        .padding(10)
        .frame(width: 60, height: 60)
        .cornerRadius(30)
    }
}

struct PlacesListCellData: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let iconUrlString: String
    let rating: Double
    let ratingCount: Int
    let address: String
}

extension PlacesListCellData {
    var ratingDisplayName: String {
        String(format:"%.1f", rating)
    }
    
    var iconUrl: URL? {
        URL(string: iconUrlString)
    }
}


struct PlacesListCell_Previews: PreviewProvider {
    static var previews: some View {
        
        let data = PlacesListCellData(
            name: "Place Name",
            iconUrlString: "https://d2lnr5mha7bycj.cloudfront.net/itemimage/image/12215-eaac44d114cb00be4e3ecc26e0cf39be.jpg",
            rating: 4.5,
            ratingCount: 235,
            address: "269 Gateway Drive, Pacifica, CA 94044, United States oka ok Okay fdfd dfdfd dfdk df"
        )
        
        PlacesListCell(data: data)
    }
}
