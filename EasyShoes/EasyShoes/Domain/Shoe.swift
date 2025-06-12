//
//  Shoe.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//


struct Shoe: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let image: String
    let brand: String
    let description: String
    let sizes: [ShoeSize]
}

struct ShoeSize: Equatable, Hashable {
    let size: String
    let stock: Int
}
