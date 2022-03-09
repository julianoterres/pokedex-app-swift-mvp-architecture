//___FILEHEADER___

import UIKit

// MARK: Methods of ___VARIABLE_MVPModuleName___Screen

class ___VARIABLE_MVPModuleName___Screen: UIView {

  // MARK: Private Properties

  weak var delegate: ___VARIABLE_MVPModuleName___ScreenToViewControllerProtocol?

  // MARK: Views

  // MARK: Inicialization

  override init(frame: CGRect = .zero) {
    super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Functions

}

// MARK: Methods of Code View Protocol

extension ___VARIABLE_MVPModuleName___Screen: CodeView {

  func buildViewHierarchy() {
  }

  func setupConstraints() {
  }

  func setupAditionalConfiguration() {
  }

}