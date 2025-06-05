//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var uiState: UIState<User> = .idle
    
    
    func login() {
        uiState = .loading
        AuthService().login(username: username, password: password) { user, message in
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
