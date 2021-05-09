//
//  CharacterError.swift
//  RaMAPI
//
//  Created by JJB on 5/5/21.
//

import Foundation

enum CharacterError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach Web Server"
            
        case .thrownError(let error ):
            print(error.localizedDescription)
            return "That person cannont be found"
            
        case .noData:
            return "The server responded with no data"
            
        case .unableToDecode:
            return " The server responded with bad data.  Blame the back-end team, not the front-end."
        }
    }
} //End of enum
