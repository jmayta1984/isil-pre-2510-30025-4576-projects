//
//  FavoriteShoeEntity+Extensions.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

extension FavoriteShoeEntity {
    
    func fromDomain(favorite: FavoriteShoe) {
        id = Int16(favorite.id)
        name = favorite.name
        image = favorite.image
        price = Int16(favorite.price)
    }
    
    func toDomain() -> FavoriteShoe {
        FavoriteShoe(
            id: Int(id),
            name: name ?? "",
            price: Int(price),
            image: image ?? "")
    }
}

