//___FILEHEADER___

import UIKit

protocol ___VARIABLE_MVPModuleName___ScreenToViewControllerProtocol: AnyObject {
}

protocol ___VARIABLE_MVPModuleName___ViewControllerToPresenterProtocol: AnyObject {
  var viewEntity: ___VARIABLE_MVPModuleName___ViewEntity { get }
}

protocol ___VARIABLE_MVPModuleName___PresenterProtocol: AnyObject {
  var viewController: ___VARIABLE_MVPModuleName___PresenterToViewControllerProtocol? { get set }
}

protocol ___VARIABLE_MVPModuleName___PresenterToRouterProtocol: AnyObject {
}

protocol ___VARIABLE_MVPModuleName___PresenterToViewControllerProtocol: AnyObject {
}

protocol ___VARIABLE_MVPModuleName___RouterProtocol: AnyObject {
  var viewController: UIViewController? { get set }
  func build() -> UIViewController
}
