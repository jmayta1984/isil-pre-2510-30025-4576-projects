//
//  ProducEntity+Extensions.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/14/25.
//

import Foundation

extension ProductEntity {
    
    func fromProduct(product: Product) {
        self.id = product.id
        self.name = product.name
        self.quantity = Int16(product.quantiy)
    }
    
    func toProduct() -> Product {
        return Product(id: self.id ?? UUID(), name: self.name ?? "", quantiy: Int(self.quantity))
    }
}
