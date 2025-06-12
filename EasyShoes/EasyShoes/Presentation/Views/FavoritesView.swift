//
//  Untitled.swift
//  EasyShoes
//
//  Created by user272495 on 6/11/25.
//

import SwiftUI

struct FavoritesView: View {
    
        
    let favorites = [
        FavoriteShoe(id: 1, name: "Adidas Samba", price: 100, image: "https://images.novelship.com/product/1681910497692_adidasNMD_0.png"),
        FavoriteShoe(id: 2, name: "Adidas Samba", price: 100, image: "https://images.novelship.com/product/1681910497692_adidasNMD_0.png"),
        FavoriteShoe(id: 3, name: "Adidas Samba", price: 100, image: "https://images.novelship.com/product/1681910497692_adidasNMD_0.png")
    ]
    var body: some View {
        List {
            ForEach(favorites) { favorite in
                FavoriteShoeCardView(favorite: favorite)
            }
           
            .listRowSeparator(.hidden)

        }
        .listStyle(PlainListStyle())

    }
}
