//
//  AuthService.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

import Foundation

class AuthService {
    let url = "https://dummyjson.com/auth/login"
    
    func login(username: String, password: String , completion: @escaping(LoginResponse?, String?) -> Void) {
        
        HttpRequestHelper().POST(url: url, body: LoginRequest(username: username, password: password)) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, "Error: no data")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(response, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
