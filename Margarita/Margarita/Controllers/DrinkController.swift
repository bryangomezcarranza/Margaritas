//
//  DrinkController.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import UIKit

class DrinkController {
    
    static func fetchDrink(completion: @escaping (Result<[Margarita], DrinkError>) -> Void) {
        guard let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else { return completion(.failure(.invalidURL))}
        print(baseURL)
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let drink = try JSONDecoder().decode(Drink.self, from: data)
                let secondLevel = drink.drinks
                return completion(.success(secondLevel))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    static func fetchThumbnail(thumbnail: String, completion: @escaping (Result<UIImage, DrinkError>) -> Void) {
        guard let finalURL = URL(string: thumbnail) else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData))}
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode))}
            return completion(.success(image))
        }.resume()
    }
}
