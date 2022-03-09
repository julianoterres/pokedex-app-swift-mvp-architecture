//
//  PokemonDetailsViewControllerMock.swift
//  PokemonTests
//
//  Created by Juliano Terres on 09/03/22.
//

@testable import Pokemon

// MARK: Methods of PokemonDetailsPresenterToRouterProtocol

class PokemonDetailsViewControllerMock: PokemonDetailsPresenterToViewControllerProtocol {

  private(set) var setupButtonFavoriteEnableCalled = false

  func setupButtonFavoriteEnable() {
    setupButtonFavoriteEnableCalled = true
  }

  private(set) var setupButtonFavoriteDisableCalled = false

  func setupButtonFavoriteDisable() {
    setupButtonFavoriteDisableCalled = true
  }

  private(set) var showAlertErrorCalled = false

  func showAlertError(title: String, message: String) {
    showAlertErrorCalled = true
  }

  private(set) var showLoaderCalled = false

  func showLoader() {
    showLoaderCalled = true
  }

  private(set) var hideLoaderCalled = false

  func hideLoader() {
    hideLoaderCalled = true
  }

  private(set) var showErrorCalled = false

  func showError(title: String, message: String) {
    showErrorCalled = true
  }

  private(set) var hideErrorCalled = false

  func hideError() {
    hideErrorCalled = true
  }

  private(set) var showListCalled = false

  func showList() {
    showListCalled = true
  }

  private(set) var hideListCalled = false

  func hideList() {
    hideListCalled = true
  }

  private(set) var reloadDataCalled = false

  func reloadData() {
    reloadDataCalled = true
  }

}
