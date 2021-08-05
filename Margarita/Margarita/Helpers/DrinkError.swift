//
//  DrinkError.swift
//  Margarita
//
//  Created by Bryan Gomez on 8/4/21.
//

import Foundation

enum DrinkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The server failed to reach the necessary URL"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server wasnt able to get no data"
        case .unableToDecode:
            return "The server was not able to decode the data, bad data"
        }
    }
}
