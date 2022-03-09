//___FILEHEADER___

import UIKit

// MARK: Methods of ___VARIABLE_MVPModuleName___Router

class ___VARIABLE_MVPModuleName___Router: ___VARIABLE_MVPModuleName___RouterProtocol {

  // MARK: Private Properties

  weak var viewController: UIViewController?

  func build() -> UIViewController {

    let presenter = ___VARIABLE_MVPModuleName___Presenter(
      router: self
    )

    let viewController = ___VARIABLE_MVPModuleName___ViewController(
      presenter: presenter
    )

    presenter.viewController = viewController
    self.viewController = viewController

    return viewController

  }

}

// MARK: Methods of ___VARIABLE_MVPModuleName___PresenterToRouterProtocol

extension ___VARIABLE_MVPModuleName___Router: ___VARIABLE_MVPModuleName___PresenterToRouterProtocol {
}
