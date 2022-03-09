//___FILEHEADER___

import Foundation

// MARK: Methods of ___VARIABLE_MVPModuleName___Presenter

class ___VARIABLE_MVPModuleName___Presenter: ___VARIABLE_MVPModuleName___PresenterProtocol {

  // MARK: Private Properties

  weak var viewController: ___VARIABLE_MVPModuleName___PresenterToViewControllerProtocol?
  private let router: ___VARIABLE_MVPModuleName___PresenterToRouterProtocol

  // MARK: Public Properties

  private(set) var viewEntity = ___VARIABLE_MVPModuleName___ViewEntity()

  // MARK: Inicialization

  init(
    router: ___VARIABLE_MVPModuleName___PresenterToRouterProtocol
  ) {
    self.router = router
  }

}

// MARK: Methods of ___VARIABLE_MVPModuleName___ViewControllerToPresenterProtocol

extension ___VARIABLE_MVPModuleName___Presenter: ___VARIABLE_MVPModuleName___ViewControllerToPresenterProtocol {
}