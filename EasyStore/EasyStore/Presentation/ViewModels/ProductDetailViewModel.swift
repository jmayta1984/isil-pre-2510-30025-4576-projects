//
//  ShoeDetailViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var isFavorite = false
    let dao = FavoriteProductDAO.shared

    func toggleFavorite(shoe: Product) {
        isFavorite.toggle()
        if (isFavorite) {
           /* dao.insertFavorite(
                favorite: FavoriteShoe(id: shoe.id,
                                       name: shoe.name,
                                       price: shoe.price,
                                       image: shoe.image))
            */
        } else {
           /* dao.deleteFavorite(id: shoe.id)*/
        }
    }
    
    func checkFavorite(id: Int) {
        isFavorite = dao.isFavorite(id: id)
    }
}
