//
//  ViewModel.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import Foundation

class PokemonViewModel {
    var pokemons: [Pokemon] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchPokemon(limit: Int, offset: Int) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data,  error == nil else { return }
            
            do {
                let decodeData = try JSONDecoder().decode(PokemonResponse.self, from: data)
                self.pokemons = decodeData.results
                
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
}
