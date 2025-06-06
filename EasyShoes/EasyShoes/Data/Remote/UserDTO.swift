//
//  LoginResponse.swift
//  EasyShoes
//
//  Created by user272495 on 5/28/25.
//

struct UserDTO: Decodable {
    
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let image: String
    
    func toDomain() -> User {
        User(id: id, username: username, email: email, fullname: "\(firstName) \(lastName)", image: image)
    }
}
