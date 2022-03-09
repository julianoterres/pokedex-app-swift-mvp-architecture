//
//  FavoritesScreen.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of FavoritesScreen

class FavoritesScreen: UIView {

  // MARK: Private Properties

  weak var delegate: FavoritesScreenToViewControllerProtocol?

  // MARK: Views

  lazy var collectionView: UICollectionView = {
    let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 16
    layout.minimumInteritemSpacing = 16
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    collectionView.collectionViewLayout = layout
    collectionView.showsVerticalScrollIndicator = false
    collectionView.backgroundColor = .clear
    collectionView.isHidden = true
    collectionView.isUserInteractionEnabled = false
    collectionView.register(PokemonCell.self)
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

  lazy var emptyLabel: UILabel = {
    let emptyLabel = UILabel()
    emptyLabel.text = "Você não possui favoritos."
    emptyLabel.font = .systemFont(ofSize: 16)
    emptyLabel.textColor = .black
    emptyLabel.textAlignment = .center
    emptyLabel.isHidden = true
    emptyLabel.isUserInteractionEnabled = false
    return emptyLabel
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

  private func emptyLabeletupConstraints() {
    emptyLabel.addConstraint(attribute: .centerX,
                             alignElement: self,
                             alignElementAttribute: .centerX,
                             constant: 0)
    emptyLabel.addConstraint(attribute: .centerY,
                             alignElement: self,
                             alignElementAttribute: .centerY,
                             constant: 0)
  }

}

// MARK: Methods of Code View Protocol

extension FavoritesScreen: CodeView {

  func buildViewHierarchy() {
    addSubview(loaderView)
    addSubview(collectionView)
    addSubview(errorView)
    addSubview(emptyLabel)
  }

  func setupConstraints() {
    loaderSetupConstraints()
    collectionViewSetupConstraints()
    errorViewSetupConstraints()
    emptyLabeletupConstraints()
  }

  func setupAditionalConfiguration() {
    backgroundColor = .white
  }

}
