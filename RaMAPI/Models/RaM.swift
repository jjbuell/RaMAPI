//
//  RaM.swift
//  RaMAPI
//
//  Created by JJB on 5/5/21.
//

import Foundation

struct CharacterTopLevelObject: Codable {

    let info: InfoObject
    let results: [CharacterResults]
}

struct InfoObject: Codable {
    let count: Int
}

struct CharacterResults: Codable {
    let name: String
    let species: String
    let image: URL
}
