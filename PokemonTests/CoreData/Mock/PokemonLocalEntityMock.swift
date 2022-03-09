//
//  PokemonLocalEntityMock.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

@testable import Pokemon
import Foundation

extension PokemonLocalEntity {

  static var mock: PokemonLocalEntity {
    let stored = PokemonLocalEntity(context: Database().context)
    stored.name = "name"
    stored.data = try? JSONEncoder().encode(PokemonEntity.mock)
    return stored
  }

}
