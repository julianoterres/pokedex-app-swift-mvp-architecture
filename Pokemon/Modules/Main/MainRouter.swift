//
//  MainRouter.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of MainRouter

class MainRouter: MainRouterProtocol {

  // MARK: Private Properties

  weak var viewController: UITabBarController?

  func build() -> UITabBarController {

    let presenter = MainPresenter(
      router: self
    )

    let viewController = MainViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of MainPresenterToRouterProtocol

extension MainRouter: MainPresenterToRouterProtocol {
}
