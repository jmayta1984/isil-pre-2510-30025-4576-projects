//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = "emilys"
    @Published var password = "emilyspass"
    @Published var uiState: UIState<User> = .idle
    let service = AuthService.shared
    
    func login() {
        uiState = .loading
        service.login(username: username, password: password) { user, message in
            DispatchQueue.main.async {
                if let user = user {
                    self.uiState = .success(user)
                } else {
                    self.uiState = .failure(message ?? "Unknow error")
                }
            }
           
        }
    }
    
}
