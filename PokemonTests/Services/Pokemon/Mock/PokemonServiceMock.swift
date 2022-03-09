//
//  PokemonServiceMock.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

@testable import Pokemon
import Alamofire
import Foundation

// MARK: Methods of PokemonServiceProtocol

class PokemonServiceMock: PokemonServiceProtocol {

  var fetchResult: Result<PokemonsListEntity, Error>!

  func fetch(parameters: Parameters, complete: @escaping (Result<PokemonsListEntity, Error>) -> Void) {
    complete(fetchResult)
  }

  var detailsCalled = false
  var detailsResult: Result<PokemonEntity, Error>!

  func details(name: String, complete: @escaping (Result<PokemonEntity, Error>) -> Void) {
    detailsCalled = true
    complete(detailsResult)
  }

  var favoriteResult: Result<Void, Error>!

  func favorite(name: String, pokemon: Data, complete: @escaping (Result<Void, Error>) -> Void) {
    complete(favoriteResult)
  }

  var unfavoriteResult: Result<Void, Error>!

  func unfavorite(name: String, complete: @escaping (Result<Void, Error>) -> Void) {
    complete(unfavoriteResult)
  }

  var getStoredResult: Result<[PokemonLocalEntity]?, Error>!

  func getStored(name: String, complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void) {
    complete(getStoredResult)
  }

  var getAllStoredCalled = false
  var getAllStored: Result<[PokemonLocalEntity]?, Error>!

  func getAllStored(complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void) {
    getAllStoredCalled = true
    complete(getAllStored)
  }

}
