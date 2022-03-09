//
//  MainProtocols.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

protocol MainViewControllerToPresenterProtocol: AnyObject {
  var viewModel: MainViewModel { get }
}

protocol MainPresenterProtocol: AnyObject {
  var viewController: MainPresenterToViewControllerProtocol? { get set }
}

protocol MainPresenterToRouterProtocol: AnyObject {
}

protocol MainPresenterToViewControllerProtocol: AnyObject {
}

protocol MainRouterProtocol: AnyObject {
  var viewController: UITabBarController? { get set }
  func build() -> UITabBarController
}
