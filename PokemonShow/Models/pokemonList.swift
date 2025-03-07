//
//  pokemonList.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    var id: String {
        return url.split(separator: "/").last.map { String($0) } ?? ""
    }
}

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}
