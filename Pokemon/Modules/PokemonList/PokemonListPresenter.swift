//
//  PokemonListPresenter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Foundation

// MARK: Methods of PokemonListPresenter

class PokemonListPresenter: PokemonListPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: PokemonListPresenterToViewControllerProtocol?
  private let router: PokemonListPresenterToRouterProtocol
  private let pokemonService: PokemonServiceProtocol
  private var offset = 0
  private var fetchActive = false
  private let limit = 100

  // MARK: Public Properties

  private(set) var viewModel = PokemonListViewModel()

  // MARK: Inicialization

  init(
    router: PokemonListPresenterToRouterProtocol,
    pokemonService: PokemonServiceProtocol
  ) {
    self.router = router
    self.pokemonService = pokemonService
  }

  // MARK: Private Methods

  private func fetch() {
    guard fetchActive == false else { return }
    fetchActive = true
    let parameters = ["limit": "\(limit)", "offset": "\(offset)"]
    pokemonService.fetch(parameters: parameters) { [weak self] result in
      switch result {
      case .success(let pokemons):
        self?.didFetchSuccess(pokemons: pokemons)
      case .failure:
        self?.didFetchFailure()
      }
    }
  }

  private func didFetchSuccess(pokemons: PokemonsListEntity) {
    let pokemons = pokemons.results.map { pokemon -> PokemonCellViewModel in
      let pokemonID = String(pokemon.url.split(separator: "/").last ?? "")
      return PokemonCellViewModel(
        name: pokemon.name,
        imageURL: URL(string: Endpoint.image(pokemon: pokemonID).path)
      )
    }
    fetchActive = false
    offset += limit
    viewModel.pokemons.append(contentsOf: pokemons)
    viewController?.reloadData()
    viewController?.hideLoader()
    viewController?.showList()
  }

  private func didFetchFailure() {
    fetchActive = false
    guard viewModel.pokemons.count == 0 else { return }
    viewController?.hideLoader()
    viewController?.showError(title: "Ops!",
                              message: "Falha ao listar os pokémons.")
  }

}

// MARK: Methods of PokemonListViewControllerToPresenterProtocol

extension PokemonListPresenter: PokemonListViewControllerToPresenterProtocol {

  func viewDidLoad() {
    fetch()
  }

  func loadMore() {
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
