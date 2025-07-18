//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var uiState: UIState<[Product]> = .idle
    private let service = ProductService.shared
    
    func getShoes() {
        uiState = .loading
        service.getShoes { shoes, message in
            DispatchQueue.main.async {
                if let shoes = shoes {
                    self.uiState = .success(shoes)
                } else {
                    self.uiState = .failure(message ?? "Unknow error")
                }
            }
        }
        
    }
}
