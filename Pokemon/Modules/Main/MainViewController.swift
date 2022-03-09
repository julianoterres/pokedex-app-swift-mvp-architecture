//
//  MainViewController.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of MainViewController

class MainViewController: UITabBarController {

  // MARK: Private Properties

  private let presenter: MainViewControllerToPresenterProtocol

  // MARK: Inicialization

  init(presenter: MainViewControllerToPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabs()
  }

  // MARK: Private Methods

  private func setupTabs() {
    let pokemonList = UINavigationController()
    pokemonList.viewControllers = [PokemonListRouter().build()]
    let pokemonListTabItem = UITabBarItem(title: "Pokedex",
                                          image: UIImage(named: "icon-pokeball"),
                                          selectedImage: nil)
    pokemonList.tabBarItem = pokemonListTabItem

    let favorites = UINavigationController()
    favorites.viewControllers = [FavoritesRouter().build()]
    let favoritesTabItem = UITabBarItem(title: "Favorites",
                                        image: UIImage(named: "icon-favorite"),
                                        selectedImage: nil)
    favorites.tabBarItem = favoritesTabItem

    viewControllers = [pokemonList, favorites]
    tabBar.barTintColor = .white
  }

}

// MARK: Methods of UMainPresenterToViewControllerProtocol

extension MainViewController: MainPresenterToViewControllerProtocol {
}
