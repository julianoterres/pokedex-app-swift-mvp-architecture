//
//  FavoritesRouterMock.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

@testable import Pokemon

// MARK: Methods of FavoritesPresenterToRouterProtocol

class FavoritesRouterMock: FavoritesPresenterToRouterProtocol {

  private(set) var presentPokemonDetailsCalled = false

  func presentPokemonDetails(pokemon: String) {
    presentPokemonDetailsCalled = true
  }

}
