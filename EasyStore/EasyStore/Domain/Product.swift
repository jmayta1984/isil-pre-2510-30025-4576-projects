//
//  Shoe.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//


struct Product: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let description: String
    let brand: String
}


