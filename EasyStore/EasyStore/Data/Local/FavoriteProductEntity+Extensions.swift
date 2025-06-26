//
//  FavoriteShoeEntity+Extensions.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

extension FavoriteProductEntity {
    
    func fromDomain(favorite: FavoriteProduct) {
        id = Int16(favorite.id)
        name = favorite.name
        image = favorite.image
        price = favorite.price
    }
    
    func toDomain() -> FavoriteProduct {
        FavoriteProduct(
            id: Int(id),
            name: name ?? "",
            price: price,
            image: image ?? "")
    }
}

