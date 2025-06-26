//
//  AuthService.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    let url = "https://dummyjson.com/auth/login"
    
    func login(username: String, password: String , completion: @escaping(User?, String?) -> Void) {
        
        HttpRequestHelper().POST(url: url, body: UserRequestDTO(username: username, password: password)) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UserDTO.self, from: data)
                completion(response.toDomain(), nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
