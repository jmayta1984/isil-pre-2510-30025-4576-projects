//
//  HomeView.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    @State var selectedGenre = "All"
    
    let genres = ["All", "Men", "Women", "Kids"]
    
    let shoes = [
        Shoe(id: 1, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 2, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 3, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 4, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 5, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 6, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 7, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"),
        Shoe(id: 8, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png")
        
        
    ]
    
    var body: some View {
        
        
        ScrollView {
            VStack (spacing: 20) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: $search)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Banner()
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(genres, id: \.self) { genre in
                            
                            Text(genre)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                            
                                .background(
                                    genre == selectedGenre ? Color.customOrange : .white)
                                .foregroundStyle(
                                    genre == selectedGenre ? .white : .gray)
                            
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(
                                    genre == selectedGenre ? Color.customOrange : .gray, lineWidth: 1))
                                .onTapGesture {
                                    selectedGenre = genre
                                }
                        }
                    }
                }
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], ) {
                    ForEach(shoes) { shoe in
                        ShoeCardView(shoe: shoe)
                    }
                }
                
                
                
                
                
                
                
                Spacer()
                
                
                
                
            }
            .padding()
        }
        
    }
}

#Preview {
    HomeView()
}
