//
//  FavoritesPresenterTests.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

import XCTest
@testable import Pokemon
import CoreData

// MARK: Methods of FavoritesPresenterTests

class FavoritesPresenterTests: XCTestCase {

  // MARK: Private Properties

  private var presenter: FavoritesPresenter!
  private var router: FavoritesRouterMock!
  private var pokemonService: PokemonServiceMock!
  private var viewController: FavoritesViewControllerMock!

  // MARK: Setups

  override func setUp() {
    super.setUp()
    router = FavoritesRouterMock()
    pokemonService = PokemonServiceMock()
    viewController = FavoritesViewControllerMock()
    presenter = FavoritesPresenter(
      router: router,
      pokemonService: pokemonService
    )
    presenter.viewController = viewController
  }

  // MARK: Tests of FavoritesViewControllerToPresenterProtocol

  func testViewFetchSuccess() {
    pokemonService.getAllStored = .success([PokemonLocalEntity.mock])
    presenter.viewWillAppear()
    XCTAssertTrue(pokemonService.getAllStoredCalled)
    XCTAssertEqual(presenter.viewModel.pokemons.count, 1)
    XCTAssertTrue(viewController.reloadDataCalled)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showListCalled)
  }

  func testViewFetchEmptySuccess() {
    pokemonService.getAllStored = .success([])
    presenter.viewWillAppear()
    XCTAssertTrue(pokemonService.getAllStoredCalled)
    XCTAssertEqual(presenter.viewModel.pokemons.count, 0)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.hideListCalled)
    XCTAssertTrue(viewController.showEmptyLabelCalled)
  }

  func testViewFetchFailure() {
    pokemonService.getAllStored = .failure(NetworkError.noData)
    presenter.viewWillAppear()
    XCTAssertTrue(pokemonService.getAllStoredCalled)
    XCTAssertEqual(presenter.viewModel.pokemons.count, 0)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showErrorCalled)
  }

  func testDidTapTryAgain() {
    pokemonService.getAllStored = .success([PokemonLocalEntity.mock])
    presenter.didTapTryAgain()
    XCTAssertTrue(viewController.hideErrorCalled)
    XCTAssertTrue(viewController.showLoaderCalled)
    XCTAssertTrue(pokemonService.getAllStoredCalled)
  }

  func testDidTapPokemon() {
    pokemonService.getAllStored = .success([PokemonLocalEntity.mock])
    presenter.viewWillAppear()
    presenter.didTapPokemon(indexPath: IndexPath(row: 0, section: 0))
    XCTAssertTrue(router.presentPokemonDetailsCalled)
  }

}
