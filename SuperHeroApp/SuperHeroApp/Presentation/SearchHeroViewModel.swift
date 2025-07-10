//
//  SearchHeroViewModel.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import Foundation
import SwiftData

class SearchHeroViewModel: ObservableObject {
    @Published var uiState: UIState<[Hero]> = .initialState
    @Published var query = ""
    
    
 
    
    func searchHeroes() {
        uiState = .loadingState
        HeroService().searchHeroes(query: query) { heroes, message in
            DispatchQueue.main.async {
                if let heroes = heroes {
                    self.uiState = .successState(heroes)
                } else {

                    self.uiState = .failureState(message ?? "Error: Unknown error")
                }
            }
            
        }
    }
    
    func toggleFavorite(hero: Hero, context: ModelContext) {
        do {
            if let existing = try context.fetch(FetchDescriptor<FavoriteHero>()).first(where: {$0.id == hero.id })
            {
                context.delete(existing)
                print("Delete")

            } else {
                
                let favorite = FavoriteHero(id: hero.id, name: hero.name, poster: hero.poster)
                print("Insert")
                context.insert(favorite)
            }
        } catch {
            print("Error: :(")
        }
        
    }
}
