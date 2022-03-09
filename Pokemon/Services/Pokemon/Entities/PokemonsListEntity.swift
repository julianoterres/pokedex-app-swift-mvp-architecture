//
//  PokemonListEntity.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

struct PokemonsListEntity: Codable {
  let count: Int
  let results: [PokemonListEntity]
}
