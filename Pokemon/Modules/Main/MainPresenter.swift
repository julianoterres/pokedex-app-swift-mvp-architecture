//
//  MainPresenter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Foundation

// MARK: Methods of MainPresenter

class MainPresenter: MainPresenterProtocol {

  // MARK: Private Properties

  weak var viewController: MainPresenterToViewControllerProtocol?
  private let router: MainPresenterToRouterProtocol

  // MARK: Public Properties

  private(set) var viewModel = MainViewModel()

  // MARK: Inicialization

  init(
    router: MainPresenterToRouterProtocol
  ) {
    self.router = router
  }

}

// MARK: Methods of MainViewControllerToPresenterProtocol

extension MainPresenter: MainViewControllerToPresenterProtocol {
}
