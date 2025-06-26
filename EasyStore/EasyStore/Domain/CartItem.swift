//
//  CartItem.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

struct CartItem: Identifiable, Equatable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let size: Double
    let quantity: Int
}
