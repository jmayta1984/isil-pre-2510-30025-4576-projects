//
//  SuperHeroAppApp.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftUI
import SwiftData

@main
struct SuperHeroApp: App {
    
    var body: some Scene {
        WindowGroup {
            FavoriteHeroListView()
                .modelContainer(for: [
                                   FavoriteHero.self,
                               ])
        }
    }
}
