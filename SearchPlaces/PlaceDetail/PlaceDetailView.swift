//
//  PlaceDetailView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/19/24.
//

import SwiftUI

struct PlaceDetailView: View {
    let data: PlacesListCellData
    
    private var imageView: some View {
        VStack {
            AsyncImage(url: data.iconUrl) { image in
                
                image.resizable()
                    .scaledToFit()
                
            } placeholder: {
                Color.gray
            }
        }
        .frame(width: 200, height: 200)
        .cornerRadius(30)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                imageView
                
                LazyVStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text(data.ratingDisplayName)
                            .font(.title)

                        HStack {
                            ForEach(0..<Int(data.rating), id: \.self) { i in
                                Image("starFullFilled")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color.green)
                            }
                        }
                        
                        Text("by: \(data.ratingCount)")
                            .font(.title)
                    }
                    
                    Text(data.address)
                        .font(.title2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Maecenas sit amet commodo nisi. Phasellus a viverra purus, a hendrerit massa. Integer vel libero et neque suscipit scelerisque. Nullam non odio ut libero gravida pharetra. Mauris ultrices est sit amet diam aliquam, ut interdum odio vulputate. Suspendisse potenti. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Maecenas sit amet commodo nisi. Phasellus a viverra purus, a hendrerit massa. Integer vel libero et neque suscipit scelerisque. Nullam non odio ut libero gravida pharetra. Mauris ultrices est sit amet diam aliquam, ut interdum odio vulputate. Suspendisse potenti. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Maecenas sit amet commodo nisi. Phasellus a viverra purus, a hendrerit massa. Integer vel libero et neque suscipit scelerisque. Nullam non odio ut libero gravida pharetra. Mauris ultrices est sit amet diam aliquam, ut interdum odio vulputate. Suspendisse potenti. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Maecenas sit amet commodo nisi. Phasellus a viverra purus, a hendrerit massa. Integer vel libero et neque suscipit scelerisque. Nullam non odio ut libero gravida pharetra. Mauris ultrices est sit amet diam aliquam, ut interdum odio vulputate. Suspendisse potenti.")
                
                Spacer()
            }
        }
        .padding(24)
        .background(Color.gray.opacity(0.15))
        .navigationTitle(data.name)

    }
}

#Preview {
    PlaceDetailView(
        data: PlacesListCellData(
            name: "Place Name",
            iconUrlString: "https://d2lnr5mha7bycj.cloudfront.net/itemimage/image/12215-eaac44d114cb00be4e3ecc26e0cf39be.jpg",
            rating: 4.5,
            ratingCount: 235,
            address: "269 Gateway Drive, Pacifica, CA 94044, United States"
        )
    )
}
