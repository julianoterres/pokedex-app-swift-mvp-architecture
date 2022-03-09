//
//  PokemonEntityMock.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

@testable import Pokemon

extension PokemonEntity {

  static var mock: PokemonEntity {
    return PokemonEntity(
      id: 0,
      height: 0,
      weight: 0,
      name: "name",
      experience: 0,
      species: PokemonSpeciesEntity(
        name: "name"
      ),
      types: [
        PokemonTypeEntity(
          type: PokemonTypeDataEntity(
            name: "name")
        )
      ],
      abilities: [
        PokemonAbilityEntity(
          isHidden: false,
          ability: PokemonAbilityDataEntity(
            name: "name"
          )
        )
      ],
      stats: [
        PokemonStatEntity(
          base: 0,
          effort: 0,
          stat: PokemonStatDataEntity(
            name: "name"
          )
        )
      ]
    )
  }

}
