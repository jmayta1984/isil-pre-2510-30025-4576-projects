//
//  ProductListViewModel.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/7/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published private(set) var products = [Product]()
    
    func addProduct(product: Product) {
        products.append(product)
    }
}
