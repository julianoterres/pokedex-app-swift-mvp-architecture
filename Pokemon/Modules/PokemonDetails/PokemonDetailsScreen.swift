//
//  PokemonDetailsScreen.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonDetailsScreen

class PokemonDetailsScreen: UIView {

  // MARK: Private Properties

  weak var delegate: PokemonDetailsScreenToViewControllerProtocol?

  // MARK: Views

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionView.collectionViewLayout = layout
    collectionView.showsVerticalScrollIndicator = false
    collectionView.backgroundColor = .clear
    collectionView.isHidden = true
    collectionView.isUserInteractionEnabled = false
    collectionView.register(PokemonDetailsImageCell.self)
    collectionView.register(PokemonDetailsInfosCell.self)
    return collectionView
  }()

  lazy var loaderView: UIActivityIndicatorView = {
    let loaderView = UIActivityIndicatorView()
    loaderView.color = .black
    loaderView.startAnimating()
    loaderView.hidesWhenStopped = true
    return loaderView
  }()

  lazy var errorView: ErrorView = {
    let errorView = ErrorView()
    errorView.isHidden = true
    errorView.isUserInteractionEnabled = false
    return errorView
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

  private func loaderSetupConstraints() {
    loaderView.addConstraint(attribute: .centerX,
                             alignElement: self,
                             alignElementAttribute: .centerX,
                             constant: 0)
    loaderView.addConstraint(attribute: .centerY,
                             alignElement: self,
                             alignElementAttribute: .centerY,
                             constant: 0)
    loaderView.addConstraint(attribute: .width,
                             constant: 16)
    loaderView.addConstraint(attribute: .height,
                             constant: 16)
  }

  private func collectionViewSetupConstraints() {
    collectionView.addConstraint(attribute: .left,
                                 alignElement: self,
                                 alignElementAttribute: .left,
                                 constant: 0)
    collectionView.addConstraint(attribute: .right,
                                 alignElement: self,
                                 alignElementAttribute: .right,
                                 constant: 0)
    collectionView.addConstraint(attribute: .top,
                                 alignElement: safeAreaLayoutGuide,
                                 alignElementAttribute: .top,
                                 constant: 0)
    collectionView.addConstraint(attribute: .bottom,
                                 alignElement: safeAreaLayoutGuide,
                                 alignElementAttribute: .bottom,
                                 constant: 0)
  }

  private func errorViewSetupConstraints() {
    errorView.addConstraint(attribute: .left,
                            alignElement: self,
                            alignElementAttribute: .left,
                            constant: 0)
    errorView.addConstraint(attribute: .right,
                            alignElement: self,
                            alignElementAttribute: .right,
                            constant: 0)
    errorView.addConstraint(attribute: .top,
                            alignElement: safeAreaLayoutGuide,
                            alignElementAttribute: .top,
                            constant: 0)
    errorView.addConstraint(attribute: .bottom,
                            alignElement: safeAreaLayoutGuide,
                            alignElementAttribute: .bottom,
                            constant: 0)
  }

}

// MARK: Methods of Code View Protocol

extension PokemonDetailsScreen: CodeView {

  func buildViewHierarchy() {
    addSubview(loaderView)
    addSubview(collectionView)
    addSubview(errorView)
  }

  func setupConstraints() {
    loaderSetupConstraints()
    collectionViewSetupConstraints()
    errorViewSetupConstraints()
  }

  func setupAditionalConfiguration() {
    backgroundColor = .white
  }

}
