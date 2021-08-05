//
//  Margarita.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import Foundation

struct Drink: Codable {
    let drinks: [Margarita]
}

struct Margarita: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let strInstructions: String
    let strAlcoholic: String
}
