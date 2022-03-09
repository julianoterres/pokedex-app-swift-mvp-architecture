//
//  PokemonDetailsProtocols.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

protocol PokemonDetailsScreenToViewControllerProtocol: AnyObject {
}

protocol PokemonDetailsViewControllerToPresenterProtocol: AnyObject {
  var viewModel: PokemonDetailsViewModel { get }
  func viewDidLoad()
  func didTapTryAgain()
  func didTapFavorite()
  func didTapUnfavorite()
}

protocol PokemonDetailsPresenterProtocol: AnyObject {
  var viewController: PokemonDetailsPresenterToViewControllerProtocol? { get set }
}

protocol PokemonDetailsPresenterToRouterProtocol: AnyObject {
}

protocol PokemonDetailsPresenterToViewControllerProtocol: AnyObject {
  func setupButtonFavoriteEnable()
  func setupButtonFavoriteDisable()
  func showAlertError(title: String, message: String)
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
  func hideError()
  func showList()
  func hideList()
  func reloadData()
}

protocol PokemonDetailsRouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build(pokemon: String) -> UIViewController
}
