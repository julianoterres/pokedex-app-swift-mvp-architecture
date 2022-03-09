//
//  PokemonDetailsViewController.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonDetailsViewController

class PokemonDetailsViewController: UIViewController {

  // MARK: Private Properties

  private let presenter: PokemonDetailsViewControllerToPresenterProtocol
  private let screen = PokemonDetailsScreen()

  // MARK: Inicialization

  init(presenter: PokemonDetailsViewControllerToPresenterProtocol) {
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
    presenter.viewDidLoad()
  }

  override func loadView() {
    view = screen
  }

  // MARK: Private Methods

  private func setupElements() {
    title = "Pokémon"
    screen.collectionView.delegate = self
    screen.collectionView.dataSource = self
    screen.errorView.delegate = self
  }

  private func setupFavoriteButton(image: String, action: Selector) {
    let image = UIImage(named: image)
    let settingsButton = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
    navigationItem.rightBarButtonItem = settingsButton
  }

  @objc private func didTapFavorite() {
    presenter.didTapFavorite()
  }

  @objc private func didTapUnfavorite() {
    presenter.didTapUnfavorite()
  }

  private func getCell(indexPath: IndexPath) -> UICollectionViewCell {
    switch presenter.viewModel.rows[indexPath.row] {
    case let data as PokemonDetailsImageCellViewModel:
      return getImageCell(data: data, indexPath: indexPath)
    case let data as PokemonDetailsInfosCellViewModel:
      return getInfosCell(data: data, indexPath: indexPath)
    default:
      return UICollectionViewCell()
    }
  }

  private func getImageCell(data: PokemonDetailsImageCellViewModel,
                            indexPath: IndexPath) -> UICollectionViewCell {
    let cell: PokemonDetailsImageCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = data
    return cell
  }

  private func getInfosCell(data: PokemonDetailsInfosCellViewModel,
                            indexPath: IndexPath) -> UICollectionViewCell {
    let cell: PokemonDetailsInfosCell = screen.collectionView.dequeueReusableCell(forIndexPath: indexPath)
    cell.data = data
    return cell
  }

}

// MARK: Methods of UPokemonDetailsPresenterToViewControllerProtocol

extension PokemonDetailsViewController: PokemonDetailsPresenterToViewControllerProtocol {

  func setupButtonFavoriteEnable() {
    setupFavoriteButton(image: "icon-favorite-filled", action: #selector(didTapUnfavorite))
  }

  func setupButtonFavoriteDisable() {
    setupFavoriteButton(image: "icon-favorite", action: #selector(didTapFavorite))
  }

  func showAlertError(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
  }

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

  func reloadData() {
    screen.collectionView.reloadData()
  }

}

// MARK: Methods of UICollectionViewDelegate and UICollectionViewDataSource

extension PokemonDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.viewModel.rows.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return getCell(indexPath: indexPath)
  }

}

// MARK: Methods of ErrorViewDelegate

extension PokemonDetailsViewController: ErrorViewDelegate {

  func didTapButton() {
    presenter.didTapTryAgain()
  }

}
