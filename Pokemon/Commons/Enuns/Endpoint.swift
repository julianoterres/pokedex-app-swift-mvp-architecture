//
//  Endpoint.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

enum Endpoint {

  case list
  case details(pokemon: String)
  case image(pokemon: String)

  var path: String {
    let baseURL = "https://pokeapi.co/api/v2"
    switch self {
    case .list:
      return "\(baseURL)/pokemon"
    case .details(let pokemon):
      return "\(baseURL)/pokemon/\(pokemon)"
    case .image(let pokemon):
      return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon).png"
    }
  }

}
