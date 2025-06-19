//
//  CartViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/18/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var uiState: UIState<[CartItem]> = .idle
    
    func getCartItems(username: String) {
        uiState = .loading
        /*
        CartService().getCartIems(username: username) { cartItems, message in
            DispatchQueue.main.async {
                if let cartItems = cartItems {
                    self.uiState = .success(cartItems)
                } else {
                    self.uiState = .failure(message ?? "Unknown error")
                }
            }
        }
        */
        
    }
}
