//
//  FavoritesViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteShoe]()
    private let dao = FavoriteShoeDAO.shared
    
    func getAllFavorites() {
        favorites = dao.fetchAllFavorites()
    }
    
    func removeFavorite(favorite: FavoriteShoe) {
        dao.deleteFavorite(id: favorite.id)
        getAllFavorites()
    }
    
    func removeFavoriteByIndex(indexSet: IndexSet) {
        if let index = indexSet.first {
            removeFavorite(favorite: favorites[index])
        }
    }
}
