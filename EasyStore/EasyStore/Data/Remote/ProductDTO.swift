//
//  ShoeDTO.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

struct ProductDTO: Decodable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let description: String
    let brand: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case price
        case image
        case description
        case brand = "category"
    }
    
    func toDomain() -> Product {
        Product(id: id, name: name, price: price, image: image,  description: description, brand: brand)
    }
}
