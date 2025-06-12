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
    let description: String
    let brand: String
    let sizes: [ShoeSizeDTO]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case image
        case description
        case brand
        case sizes = "sizes_available"
    }
    
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, price: price, image: image, brand: brand, description: description, sizes: sizes.map({ $0.toDomain() }))
    }
}

struct ShoeSizeDTO: Decodable {
    let size: Double
    let stock: Int
    
    enum CodingKeys: String, CodingKey {
        case size
        case stock = "quantity"
    }
    func toDomain() -> ShoeSize {
        ShoeSize(size: "\(size)", stock: stock)
    }
}
