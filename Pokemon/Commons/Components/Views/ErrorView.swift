//
//  ErrorView.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of ErrorViewDelegate

protocol ErrorViewDelegate: AnyObject {
  func didTapButton()
}

// MARK: Methods of ErrorView

class ErrorView: UIView {

  // MARK: Private Properties

  weak var delegate: ErrorViewDelegate?

  // MARK: Views

  lazy var textContainer: UIStackView = {
    let textContainer = UIStackView()
    textContainer.axis = .vertical
    textContainer.spacing = 8
    textContainer.alignment = .center
    return textContainer
  }()

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 24)
    titleLabel.textColor = .black
    return titleLabel
  }()

  lazy var textLabel: UILabel = {
    let textLabel = UILabel()
    textLabel.font = .systemFont(ofSize: 14)
    textLabel.textColor = .black
    return textLabel
  }()

  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Tentar novamente", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 8
    return button
  }()

  // MARK: Inicialization

  override init(frame: CGRect = .zero) {
    super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private Functions

  private func textContainerSetupConstraints() {
    textContainer.addConstraint(attribute: .centerX,
                                alignElement: self,
                                alignElementAttribute: .centerX,
                                constant: 0)
    textContainer.addConstraint(attribute: .centerY,
                                alignElement: self,
                                alignElementAttribute: .centerY,
                                constant: 0)
  }

  private func buttonSetupConstraints() {
    button.addConstraint(attribute: .left,
                         alignElement: self,
                         alignElementAttribute: .left,
                         constant: 16)
    button.addConstraint(attribute: .right,
                         alignElement: self,
                         alignElementAttribute: .right,
                         constant: 16)
    button.addConstraint(attribute: .bottom,
                         alignElement: safeAreaLayoutGuide,
                         alignElementAttribute: .bottom,
                         constant: 16)
    button.addConstraint(attribute: .height,
                         constant: 48)
  }

  @objc func didTapButton(_ sender: UIButton) {
    delegate?.didTapButton()
  }

}

// MARK: Methods of Code View Protocol

extension ErrorView: CodeView {

  func buildViewHierarchy() {
    addSubview(textContainer)
    textContainer.addArrangedSubview(titleLabel)
    textContainer.addArrangedSubview(textLabel)
    addSubview(button)
  }

  func setupConstraints() {
    textContainerSetupConstraints()
    buttonSetupConstraints()
  }

  func setupAditionalConfiguration() {
    backgroundColor = .white
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }

}
