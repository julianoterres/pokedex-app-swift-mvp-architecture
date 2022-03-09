//
//  PokemonService.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Alamofire
import Foundation
import UIKit
import CoreData

// MARK: Protocol of PokemonServiceProtocol

protocol PokemonServiceProtocol {
  func fetch(parameters: Parameters, complete: @escaping (Result<PokemonsListEntity, Error>) -> Void)
  func details(name: String, complete: @escaping (Result<PokemonEntity, Error>) -> Void)
  func favorite(name: String, pokemon: Data, complete: @escaping (Result<Void, Error>) -> Void)
  func unfavorite(name: String, complete: @escaping (Result<Void, Error>) -> Void)
  func getStored(name: String, complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void)
  func getAllStored(complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void)
}

// MARK: Methods of PokemonListPresenter

class PokemonService {

  // MARK: Private Properties

  private let network: NetworkProtocol
  private let database: DatabaseProtocol

  // MARK: Inicialization

  init(network: NetworkProtocol, database: DatabaseProtocol) {
    self.network = network
    self.database = database
  }

  // MARK: Private Functions

  private func getDetailsAPI(name: String, complete: @escaping (Result<PokemonEntity, Error>) -> Void) {
    network.request(url: .details(pokemon: name), method: .get, parameters: nil) { result in
      switch result {
      case .success(let data):
        guard let pokemon = try? JSONDecoder().decode(PokemonEntity.self, from: data) else {
          complete(.failure(NetworkError.noData))
          return
        }
        complete(.success(pokemon))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

}

// MARK: Methods of PokemonServiceProtocol

extension PokemonService: PokemonServiceProtocol {

  func fetch(parameters: Parameters, complete: @escaping (Result<PokemonsListEntity, Error>) -> Void) {
    network.request(url: .list, method: .get, parameters: parameters) { result in
      switch result {
      case .success(let data):
        guard let pokemons = try? JSONDecoder().decode(PokemonsListEntity.self, from: data) else {
          complete(.failure(NetworkError.noData))
          return
        }
        complete(.success(pokemons))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

  func details(name: String, complete: @escaping (Result<PokemonEntity, Error>) -> Void) {
    database.get(entity: PokemonLocalEntity.self,
                 query: NSPredicate(format: "name == %@", name)) { [weak self] result in
      switch result {
      case .success(let pokemons):
        guard let pokemonStored = pokemons.first as? PokemonLocalEntity,
              let data = pokemonStored.data,
              let pokemon = try? JSONDecoder().decode(PokemonEntity.self, from: data) else {
          self?.getDetailsAPI(name: name, complete: complete)
          return
        }
        complete(.success(pokemon))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

  func favorite(name: String, pokemon: Data, complete: @escaping (Result<Void, Error>) -> Void) {
    let entity = PokemonLocalEntity(context: database.context)
    entity.name = name
    entity.data = pokemon
    database.save { result in complete(result) }
  }

  func unfavorite(name: String, complete: @escaping (Result<Void, Error>) -> Void) {
    database.delete(entity: PokemonLocalEntity.self,
                    query: NSPredicate(format: "name == %@", name)) { result in
      switch result {
      case .success:
        complete(.success(()))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

  func getStored(name: String, complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void) {
    database.get(entity: PokemonLocalEntity.self,
                 query: NSPredicate(format: "name == %@", name)) { result in
      switch result {
      case .success(let pokemons):
        complete(.success(pokemons as? [PokemonLocalEntity]))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

  func getAllStored(complete: @escaping (Result<[PokemonLocalEntity]?, Error>) -> Void) {
    database.get(entity: PokemonLocalEntity.self) { result in
      switch result {
      case .success(let pokemons):
        complete(.success(pokemons as? [PokemonLocalEntity]))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

}
