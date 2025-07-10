//
//  FavoriteHeroListView.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftUI
import SwiftData

struct FavoriteHeroListView: View {
    @Environment(\.modelContext) var context
    
    @Query var favorites: [FavoriteHero]
    
    var body: some View {
        List {
            ForEach(favorites) { favorite in
                Text(favorite.name)
            }
         
        }
    }
}
