//
//  ShoeDTO.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

struct ShoeDTO: Decodable {
    let id: Int
    let name: String
    let price: Int
    let image: String
    
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, price: price, image: image)
    }
}
