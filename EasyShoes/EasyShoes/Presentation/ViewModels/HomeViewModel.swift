//
//  HomeViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var uiState: UIState<[Shoe]> = .idle
    
    func getShoes() {
        uiState = .loading
        ShoeService().getShoes { shoes, message in
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
