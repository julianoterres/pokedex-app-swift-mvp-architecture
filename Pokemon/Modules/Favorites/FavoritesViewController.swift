//
//  FavoritesViewController.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of FavoritesViewController

class FavoritesViewController: UIViewController {

  // MARK: Private Properties

  private let presenter: FavoritesViewControllerToPresenterProtocol
  private let screen = FavoritesScreen()

  // MARK: Inicialization

  init(presenter: FavoritesViewControllerToPresenterProtocol) {
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
    setupNavigation(color: .white, titleColor: .black)
  }
  override func viewWillAppear(_ animated: Bool) {
    presenter.viewWillAppear()
  }

  override func loadView() {
    view = screen
  }

  // MARK: Private Methods

  private func setupElements() {
    title = "Favorites"
    screen.collectionView.delegate = self
    screen.collectionView.dataSource = self
    screen.errorView.delegate = self
  }

}

// MARK: Methods of UFavoritesPresenterToViewControllerProtocol

extension FavoritesViewController: FavoritesPresenterToViewControllerProtocol {

  func showLoader() {
    screen.loaderView.startAnimating()
  }

  func hideLoader() {
    screen.loaderView.stopAnimating()
  }

  func showError(title: String, message: String) {
    screen.errorView.titleLabel.text = title
    screen.errorView.textLabel.text = message
    screen.errorView.isHidden = false
    screen.errorView.isUserInteractionEnabled = true
  }

  func hideError() {
    screen.errorView.isHidden = true
    screen.errorView.isUserInteractionEnabled = false
  }

  func showList() {
    screen.collectionView.isHidden = false
    screen.collectionView.isUserInteractionEnabled = true
  }

  func hideList() {
    screen.collectionView.isHidden = true
    screen.collectionView.isUserInteractionEnabled = false
  }

  func showEmptyLabel() {
    screen.emptyLabel.isHidden = false
  }

  func hideEmptyLabel() {
    screen.emptyLabel.isHidden = true
  }

  func reloadData() {
    screen.collectionView.reloadData()
  }

}

// MARK: Methods of UICollectionViewDelegate and UICollectionViewDataSource

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.viewModel.pokemons.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: PokemonCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = presenter.viewModel.pokemons[indexPath.row]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.didTapPokemon(indexPath: indexPath)
  }

}

// MARK: Methods of ErrorViewDelegate

extension FavoritesViewController: ErrorViewDelegate {

  func didTapButton() {
    presenter.didTapTryAgain()
  }

}
