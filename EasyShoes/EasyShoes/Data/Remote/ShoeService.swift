//
//  ShoeService.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import Foundation

class ShoeService  {
    static let shared = ShoeService()
    
    private init(){}
    
    func getShoes(completion: @escaping([Shoe]?,String?) -> Void) {
        
        let url = "https://sugary-wool-penguin.glitch.me/shoes"
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
                let response = try JSONDecoder().decode([ShoeDTO].self, from: data).map { $0.toDomain() }
                completion(response, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        
        }
       
    }
}
