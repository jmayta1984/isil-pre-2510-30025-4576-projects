//
//  LoginResponse.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

struct LoginResponse: Decodable {
    
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
}
