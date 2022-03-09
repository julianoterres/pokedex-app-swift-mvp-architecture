//
//  FavoritesProtocols.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

protocol FavoritesScreenToViewControllerProtocol: AnyObject {
}

protocol FavoritesViewControllerToPresenterProtocol: AnyObject {
  var viewModel: FavoritesViewModel { get }
  func viewWillAppear()
  func didTapTryAgain()
  func didTapPokemon(indexPath: IndexPath)
}

protocol FavoritesPresenterProtocol: AnyObject {
  var viewController: FavoritesPresenterToViewControllerProtocol? { get set }
}

protocol FavoritesPresenterToRouterProtocol: AnyObject {
  func presentPokemonDetails(pokemon: String)
}

protocol FavoritesPresenterToViewControllerProtocol: AnyObject {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
  func hideError()
  func showList()
  func hideList()
  func showEmptyLabel()
  func hideEmptyLabel()
  func reloadData()
}

protocol FavoritesRouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
}
