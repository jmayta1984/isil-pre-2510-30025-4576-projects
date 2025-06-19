//
//  ShoeDetailViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class ShoeDetailViewModel: ObservableObject {
    @Published var isFavorite = false
    
    func toggleFavorite(shoe: Shoe) {
        let dao = FavoriteShoeDAO()
        isFavorite.toggle()
        if (isFavorite) {
            dao.insertFavorite(
                favorite: FavoriteShoe(id: shoe.id,
                                       name: shoe.name,
                                       price: shoe.price,
                                       image: shoe.image))
        } else {
            dao.deleteFavorite(id: shoe.id)
        }
    }
}
