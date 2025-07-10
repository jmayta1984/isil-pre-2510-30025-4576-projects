//
//  SuperHeroDeto.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

struct SuperHeroesDTO: Decodable {
    let heroes: [SuperHeroDTO]
    
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}

struct HeroDTO: Decodable {
    let id: String
    let name: String
    let image: ImageDTO
    let powerstats: PowerstatsDTO
    let biography: BiographyDTO
    let appearance: AppearanceDTO
    
    func toDomain() -> SuperHero {
        SuperHero(id: id,
                  name: name,
                  poster: image.url,
                  intelligence: Double(powerstats.intelligence) ?? 0.0,
                  strength: Double(powerstats.power) ?? 0.0,
                  speed: Double(powerstats.strength) ?? 0.0,
                  durability: Double(powerstats.speed) ?? 0.0,
                  power: Double(powerstats.power) ?? 0.0,
                  combat: Double(powerstats.durability) ?? 0.0,
                  fullName: biography.fullName,
                  placeOfBirth: biography.placeOfBirth,
                  race: appearance.race
        )
    }
}

struct ImageDTO: Decodable {
    let url: String
}

struct PowerstatsDTO: Decodable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct BiographyDTO: Decodable {
    let fullName: String
    let placeOfBirth: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
    }
}

struct AppearanceDTO: Decodable {
    let race: String
}
