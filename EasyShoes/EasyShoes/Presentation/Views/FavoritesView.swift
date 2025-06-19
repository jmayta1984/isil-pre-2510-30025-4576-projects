//
//  Untitled.swift
//  EasyShoes
//
//  Created by user272495 on 6/11/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel = FavoritesViewModel()
        
    var body: some View {
        List {
            ForEach(viewModel.favorites) { favorite in
                FavoriteShoeCardView(favorite: favorite)
            }
            .listRowSeparator(.hidden)

        }
        .listStyle(PlainListStyle())
        .onAppear {
            viewModel.getAllFavorites()
        }

    }
}
