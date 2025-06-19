//
//  ShoeDetailViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class ShoeDetailViewModel: ObservableObject {
    @Published var isFavorite = false
    let dao = FavoriteShoeDAO.shared

    func toggleFavorite(shoe: Shoe) {
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
    
    func checkFavorite(id: Int) {
        isFavorite = dao.isFavorite(id: id)
    }
}
