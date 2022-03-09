//
//  PokemonEntity.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

struct PokemonEntity: Codable {
  let id: Int
  let height: Int
  let weight: Int
  let name: String
  let experience: Int
  let species: PokemonSpeciesEntity
  let types: [PokemonTypeEntity]
  let abilities: [PokemonAbilityEntity]
  let stats: [PokemonStatEntity]

  enum CodingKeys: String, CodingKey {
    case experience = "base_experience"
    case id, height, weight, name, species, types, abilities, stats
  }
}

struct PokemonSpeciesEntity: Codable {
  let name: String
}

struct PokemonTypeEntity: Codable {
  let type: PokemonTypeDataEntity
}

struct PokemonTypeDataEntity: Codable {
  let name: String
}

struct PokemonStatEntity: Codable {
  let base: Int
  let effort: Int
  let stat: PokemonStatDataEntity

  enum CodingKeys: String, CodingKey {
    case base = "base_stat"
    case effort, stat
  }
}

struct PokemonStatDataEntity: Codable {
  let name: String
}

struct PokemonAbilityEntity: Codable {
  let isHidden: Bool
  let ability: PokemonAbilityDataEntity

  enum CodingKeys: String, CodingKey {
    case isHidden = "is_hidden"
    case ability
  }
}

struct PokemonAbilityDataEntity: Codable {
  let name: String
}
