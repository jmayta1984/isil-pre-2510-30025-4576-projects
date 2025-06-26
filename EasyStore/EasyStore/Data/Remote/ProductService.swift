//
//  ShoeService.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import Foundation

class ProductService  {
    static let shared = ProductService()
    
    private init(){}
    
    func getShoes(completion: @escaping([Product]?,String?) -> Void) {
        
        let url = "https://sugary-wool-penguin.glitch.me/products"
        HttpRequestHelper().GET(url: url) { data, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode([ProductDTO].self, from: data).map { $0.toDomain() }
                completion(response, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        
        }
       
    }
}
