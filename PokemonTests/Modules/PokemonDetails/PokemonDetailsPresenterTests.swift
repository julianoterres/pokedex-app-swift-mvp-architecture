//
//  PokemonDetailsPresenterTests.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

import XCTest
@testable import Pokemon
import CoreData

// MARK: Methods of PokemonDetailsPresenterTests

class PokemonDetailsPresenterTests: XCTestCase {

  // MARK: Private Properties

  private var presenter: PokemonDetailsPresenter!
  private var router: PokemonDetailsRouterMock!
  private var pokemonService: PokemonServiceMock!
  private var viewController: PokemonDetailsViewControllerMock!

  // MARK: Setups

  override func setUp() {
    super.setUp()
    router = PokemonDetailsRouterMock()
    pokemonService = PokemonServiceMock()
    viewController = PokemonDetailsViewControllerMock()
    presenter = PokemonDetailsPresenter(
      router: router,
      pokemonService: pokemonService,
      pokemon: "pokemon"
    )
    presenter.viewController = viewController
  }

  // MARK: Tests of PokemonDetailsViewControllerToPresenterProtocol

  func testViewFetchSuccess() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    presenter.viewDidLoad()
    XCTAssertEqual(presenter.viewModel.rows.count, 5)
    XCTAssertTrue(viewController.reloadDataCalled)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showListCalled)
  }

  func testViewFetchFailure() {
    pokemonService.detailsResult = .failure(NetworkError.noData)
    presenter.viewDidLoad()
    XCTAssertEqual(presenter.viewModel.rows.count, 0)
    XCTAssertTrue(viewController.hideLoaderCalled)
    XCTAssertTrue(viewController.showErrorCalled)
  }

  func testdidTapTryAgain() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    presenter.didTapTryAgain()
    XCTAssertTrue(viewController.hideErrorCalled)
    XCTAssertTrue(viewController.showLoaderCalled)
    XCTAssertTrue(pokemonService.detailsCalled)
  }

  func testdidTapFavoriteSuccess() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    pokemonService.favoriteResult = .success(())
    presenter.viewDidLoad()
    presenter.didTapFavorite()
    XCTAssertTrue(viewController.setupButtonFavoriteEnableCalled)
  }

  func testdidTapFavoriteFailure() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    pokemonService.favoriteResult = .failure(NetworkError.noData)
    presenter.viewDidLoad()
    presenter.didTapFavorite()
    XCTAssertTrue(viewController.showAlertErrorCalled)
  }

  func testdidTapUnfavoriteSuccess() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    pokemonService.unfavoriteResult = .success(())
    presenter.viewDidLoad()
    presenter.didTapUnfavorite()
    XCTAssertTrue(viewController.setupButtonFavoriteDisableCalled)
  }

  func testdidTapUnfavoriteFailure() {
    pokemonService.detailsResult = .success(PokemonEntity.mock)
    pokemonService.getStoredResult = .success([])
    pokemonService.unfavoriteResult = .failure(NetworkError.noData)
    presenter.viewDidLoad()
    presenter.didTapUnfavorite()
    XCTAssertTrue(viewController.showAlertErrorCalled)
  }

}
