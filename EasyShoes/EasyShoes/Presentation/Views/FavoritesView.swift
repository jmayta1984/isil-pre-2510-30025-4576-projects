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
        Group {
            if (viewModel.favorites.isEmpty){
                Text("No favorites")
            } else {
                List {
                    ForEach(viewModel.favorites) { favorite in
                        FavoriteShoeCardView(favorite: favorite) {
                            viewModel.removeFavorite(favorite: favorite)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.removeFavoriteByIndex(indexSet: indexSet)
                    }
                    .listRowInsets(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                    .listRowSeparator(.hidden)

                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear {
            viewModel.getAllFavorites()
        }

    }
}
