//
//  ProductDetailViewModel.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/7/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var quantity = ""
    @Published var errorMessage: String? = nil
    
    
    func loadData(product: Product) {
        name = product.name
        quantity = product.quantiy.description
    }
    
    func validate(id: UUID?) -> Product? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        
        guard !quantity.isEmpty else {
            errorMessage = "Quantity is empty"
            return nil
        }
        
        guard let quantity = Int(quantity) else {
            errorMessage = "Invalid quantity"
            return nil
        }
       
        errorMessage = nil
        let id = id ?? UUID()
        
        return Product(id: id, name: name, quantiy: quantity)
    }
}

