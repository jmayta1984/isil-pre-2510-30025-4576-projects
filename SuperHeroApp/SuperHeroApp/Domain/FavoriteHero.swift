//
//  HeroEntity.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftData

@Model
class FavoriteHero {
    var id: String
    var name: String
    var poster: String
    
    init(id: String, name: String, poster: String) {
        self.id = id
        self.name = name
        self.poster = poster
    }
    
}
