//
//  FavoritesPresenter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Foundation

// MARK: Methods of FavoritesPresenter

class FavoritesPresenter: FavoritesPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: FavoritesPresenterToViewControllerProtocol?
  private let router: FavoritesPresenterToRouterProtocol
  private let pokemonService: PokemonServiceProtocol

  // MARK: Public Properties

  private(set) var viewModel = FavoritesViewModel()

  // MARK: Inicialization

  init(
    router: FavoritesPresenterToRouterProtocol,
    pokemonService: PokemonServiceProtocol
  ) {
    self.router = router
    self.pokemonService = pokemonService
  }

  // MARK: Private Methods

  private func fetch() {
    pokemonService.getAllStored { [weak self] result in
      switch result {
      case .success(let pokemons):
        guard let pokemons = pokemons else {
          self?.didFetchFailure()
          return
        }
        self?.didFetchSuccess(pokemons: pokemons)
      case .failure:
        self?.didFetchFailure()
      }
    }
  }

  private func didFetchSuccess(pokemons: [PokemonLocalEntity]) {
    let pokemonsStored = pokemons.compactMap { $0 } .map { pokemonStored -> PokemonCellViewModel? in
      guard let data = pokemonStored.data,
            let pokemon = try? JSONDecoder().decode(PokemonEntity.self, from: data) else { return nil }
      return PokemonCellViewModel(
        name: pokemon.name,
        imageURL: URL(string: Endpoint.image(pokemon: "\(pokemon.id)").path)
      )
    }.compactMap { $0 }

    guard pokemonsStored.count > 0 else {
      viewController?.hideLoader()
      viewController?.hideList()
      viewController?.showEmptyLabel()
      return
    }
    viewModel.pokemons = pokemonsStored
    viewController?.hideEmptyLabel()
    viewController?.reloadData()
    viewController?.hideLoader()
    viewController?.showList()
  }

  private func didFetchFailure() {
    viewController?.hideLoader()
    viewController?.showError(title: "Ops!",
                              message: "Falha ao listar os pokémons favoritos.")
  }

}

// MARK: Methods of FavoritesViewControllerToPresenterProtocol

extension FavoritesPresenter: FavoritesViewControllerToPresenterProtocol {

  func viewWillAppear() {
    fetch()
  }

  func didTapTryAgain() {
    viewController?.hideError()
    viewController?.showLoader()
    fetch()
  }

  func didTapPokemon(indexPath: IndexPath) {
    router.presentPokemonDetails(
      pokemon: viewModel.pokemons[indexPath.row].name
    )
  }

}
