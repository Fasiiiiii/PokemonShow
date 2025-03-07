//
//  pokemonList.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
}

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}
