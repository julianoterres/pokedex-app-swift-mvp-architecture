//
//  PokemonListProtocols.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

protocol PokemonListScreenToViewControllerProtocol: AnyObject {
}

protocol PokemonListViewControllerToPresenterProtocol: AnyObject {
  var viewModel: PokemonListViewModel { get }
  func viewDidLoad()
  func loadMore()
  func didTapTryAgain()
  func didTapPokemon(indexPath: IndexPath)
}

protocol PokemonListPresenterProtocol: AnyObject {
  var viewController: PokemonListPresenterToViewControllerProtocol? { get set }
}

protocol PokemonListPresenterToRouterProtocol: AnyObject {
  func presentPokemonDetails(pokemon: String)
}

protocol PokemonListPresenterToViewControllerProtocol: AnyObject {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
  func hideError()
  func showList()
  func hideList()
  func reloadData()
}

protocol PokemonListRouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
}
