//
//  Persistence.swift
//  Dex
//
//  Created by Ana Clara Moreira Rodrigues on 12/06/25.
//

import SwiftData
import Foundation //JSONDecoder

// When the stuf in here is going to type directly to the view
@MainActor
struct PersistenceController {
    static var previewPokemon: Pokemon {
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let pokemonData = try! Data(contentsOf: Bundle.main.url(forResource: "samplepokemon", withExtension: "json")!)
        
        let pokemon = try! decoder.decode(Pokemon.self, from: pokemonData)
        
        return pokemon
    }

    // Our sample preview database
    static let preview: ModelContainer = {
        let container = try! ModelContainer(for: Pokemon.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(previewPokemon)
        
        return container
    }()
}
