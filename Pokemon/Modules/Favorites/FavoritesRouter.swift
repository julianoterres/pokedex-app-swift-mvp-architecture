//
//  FavoritesRouter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of FavoritesRouter

class FavoritesRouter: FavoritesRouterProtocol {

  // MARK: Private Properties

  weak var viewController: UIViewController?

  func build() -> UIViewController {

    let network = Network()
    let database = Database()

    let pokemonService = PokemonService(
      network: network,
      database: database
    )

    let presenter = FavoritesPresenter(
      router: self,
      pokemonService: pokemonService
    )

    let viewController = FavoritesViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of FavoritesPresenterToRouterProtocol

extension FavoritesRouter: FavoritesPresenterToRouterProtocol {

  func presentPokemonDetails(pokemon: String) {
    let pokemonDetailsViewController = PokemonDetailsRouter().build(pokemon: pokemon)
    viewController?.navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
  }

}
