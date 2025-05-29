//
//  LoginViewModel.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String? = nil
    
    
    func login() {
        
        AuthService().login(username: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error
            }
        }
    }
    
}
