//
//  FavoritesViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteShoe]()
    
    func getAllFavorites() {
        favorites = FavoriteShoeDAO().fetchAllFavorites()
    }
}
