//
//  RaMController.swift
//  RaMAPI
//
//  Created by JJB on 5/5/21.
//

import UIKit

class RaMController {
    
    
    //MARK: - Properties (baseURL)
    static let baseURL = URL(string: "https://rickandmortyapi.com/api/character/")
    
    
    //MARK: - Fetch Functions
    static func fetchCharacter(completion: @escaping (Result<CharacterResults, CharacterError>) -> Void) {
        
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        let randomID = Int.random(in:1...671)
        let characterUrl = baseURL.appendingPathComponent("\(randomID)")
        print(characterUrl)
        
        URLSession.shared.dataTask(with: characterUrl) { data, response, error in
            
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(CharacterResults.self, from: data)
                
                completion(.success(topLevelObject))
                
            } catch {
                completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for character: CharacterResults, completion: @escaping (Result<UIImage, CharacterError>) -> Void) {
        
        let url = character.image
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            guard let characterImage = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            
            completion(.success(characterImage))
        }.resume()
    }
} //End of class
