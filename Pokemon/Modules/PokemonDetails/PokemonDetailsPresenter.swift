//
//  PokemonDetailsPresenter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Foundation

// MARK: Methods of PokemonDetailsPresenter

class PokemonDetailsPresenter: PokemonDetailsPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: PokemonDetailsPresenterToViewControllerProtocol?
  private let router: PokemonDetailsPresenterToRouterProtocol
  private let pokemonService: PokemonServiceProtocol
  private let pokemon: String
  private var pokemonEntity: PokemonEntity?

  // MARK: Public Properties

  private(set) var viewModel = PokemonDetailsViewModel()

  // MARK: Inicialization

  init(
    router: PokemonDetailsPresenterToRouterProtocol,
    pokemonService: PokemonServiceProtocol,
    pokemon: String
  ) {
    self.router = router
    self.pokemonService = pokemonService
    self.pokemon = pokemon
  }

  // MARK: Private Methods

  private func fetch() {
    pokemonService.details(name: pokemon) { [weak self] result in
      switch result {
      case .success(let pokemon):
        self?.didFetchSuccess(pokemon: pokemon)
      case .failure:
        self?.didFetchFailure()
      }
    }
  }

  private func didFetchSuccess(pokemon: PokemonEntity) {
    pokemonEntity = pokemon
    setupData(pokemon: pokemon)
    checkIsFavorite()
    viewController?.reloadData()
    viewController?.hideLoader()
    viewController?.showList()
  }

  private func didFetchFailure() {
    viewController?.hideLoader()
    viewController?.showError(title: "Ops!",
                              message: "Falha ao buscar os dados do pokémon.")
  }

  private func checkIsFavorite() {
    guard let pokemon = pokemonEntity else { return }
    pokemonService.getStored(name: pokemon.name) { [weak self] result in
      switch result {
      case .success(let data):
        guard let pokemons = data, pokemons.count > 0 else {
          self?.viewController?.setupButtonFavoriteDisable()
          return
        }
        self?.viewController?.setupButtonFavoriteEnable()
      case .failure:
        self?.viewController?.setupButtonFavoriteDisable()
      }
    }
  }

  private func setupData(pokemon: PokemonEntity) {
    viewModel.rows = [
      PokemonDetailsImageCellViewModel(
        imageURL: URL(string: Endpoint.image(pokemon: "\(pokemon.id)").path)
      ),
      PokemonDetailsInfosCellViewModel(
        title: "Pokemon Infos",
        infos: [
          "Name: \(pokemon.name.capitalized)",
          "Experience: \(pokemon.experience)",
          "Height: \(pokemon.height)",
          "Weight: \(pokemon.weight)",
          "Species: \(pokemon.species.name.capitalized)"
        ]
      ),
      PokemonDetailsInfosCellViewModel(
        title: "Abilities",
        infos: pokemon.abilities.filter { !$0.isHidden }.map { $0.ability.name.capitalized }
      ),
      PokemonDetailsInfosCellViewModel(
        title: "Types",
        infos: pokemon.types.map { $0.type.name.capitalized }
      ),
      PokemonDetailsInfosCellViewModel(
        title: "Stats",
        infos: pokemon.stats.map { "\($0.stat.name.capitalized): \($0.base)" }
      )
    ]
  }

}

// MARK: Methods of PokemonDetailsViewControllerToPresenterProtocol

extension PokemonDetailsPresenter: PokemonDetailsViewControllerToPresenterProtocol {

  func viewDidLoad() {
    fetch()
  }

  func didTapTryAgain() {
    viewController?.hideError()
    viewController?.showLoader()
    fetch()
  }

  func didTapFavorite() {
    guard let pokemon = pokemonEntity,
          let data = try? JSONEncoder().encode(pokemon) else { return }
    pokemonService.favorite(name: pokemon.name, pokemon: data) { [weak self] result in
      switch result {
      case .success:
        self?.viewController?.setupButtonFavoriteEnable()
      case .failure:
        self?.viewController?.showAlertError(title: "Alerta",
                                             message: "Falha ao favoritar, tente novamente.")
      }
    }
  }

  func didTapUnfavorite() {
    guard let pokemon = pokemonEntity else { return }
    pokemonService.unfavorite(name: pokemon.name) { [weak self] result in
      switch result {
      case .success:
        self?.viewController?.setupButtonFavoriteDisable()
      case .failure:
        self?.viewController?.showAlertError(title: "Alerta",
                                             message: "Falha ao remover o favorito, tente novamente.")
      }
    }
  }

}
