//___FILEHEADER___

import UIKit

// MARK: Methods of ___VARIABLE_MVPModuleName___ViewController

class ___VARIABLE_MVPModuleName___ViewController: UIViewController {

  // MARK: Private Properties

  private let presenter: ___VARIABLE_MVPModuleName___ViewControllerToPresenterProtocol
  private let screen = ___VARIABLE_MVPModuleName___Screen()

  // MARK: Inicialization

  init(presenter: ___VARIABLE_MVPModuleName___ViewControllerToPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupElements()
  }

  override func loadView() {
    view = screen
  }

  // MARK: Private Methods

  private func setupElements() {
  }

}

// MARK: Methods of U___VARIABLE_MVPModuleName___PresenterToViewControllerProtocol

extension ___VARIABLE_MVPModuleName___ViewController: ___VARIABLE_MVPModuleName___PresenterToViewControllerProtocol {
}
