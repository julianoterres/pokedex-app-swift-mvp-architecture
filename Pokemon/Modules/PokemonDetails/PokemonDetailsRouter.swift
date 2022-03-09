//
//  PokemonDetailsRouter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonDetailsRouter

class PokemonDetailsRouter: PokemonDetailsRouterProtocol {

  // MARK: Private Properties

  weak var viewController: UIViewController?

  func build(pokemon: String) -> UIViewController {

    let network = Network()
    let database = Database()

    let pokemonService = PokemonService(
      network: network,
      database: database
    )

    let presenter = PokemonDetailsPresenter(
      router: self,
      pokemonService: pokemonService,
      pokemon: pokemon
    )

    let viewController = PokemonDetailsViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of PokemonDetailsPresenterToRouterProtocol

extension PokemonDetailsRouter: PokemonDetailsPresenterToRouterProtocol {
}
