//
//  Product.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/7/25.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id: UUID
    let name: String
    let quantiy: Int
}
