//
//  SuperHeroService.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import Foundation

class HeroService {
    private let baseUrl = "https://www.superheroapi.com/api.php/f274286a22873ec9fc7a5782940f7ca2/search/"
    
    func searchHeroes(query: String, completion: @escaping([SuperHero]?, String?) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(query)") else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, "Error: HTTP request failed")
                return
            }
            
            guard let data = data else {
                completion(nil, "Error: no data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: no response")
                return
            }
            
            do {
                let heroesDTO = try JSONDecoder().decode(SuperHeroesDTO.self, from: data)
                
                let heroes = heroesDTO.heroes.map({$0.toDomain()})
                completion(heroes, nil)
                
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
