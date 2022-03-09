//
//  PokemonDetailsInfosCell.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonDetailsInfosCell

class PokemonDetailsInfosCell: UICollectionViewCell {

  // MARK: Public Properties

  var data: PokemonDetailsInfosCellViewModel? {
    didSet {
      titleLabel.text = data?.title
      setupInfos()
    }
  }

  // MARK: Views

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 24, weight: .black)
    titleLabel.textColor = .black
    return titleLabel
  }()

  lazy var infosContainerView: UIStackView = {
    let infosContainerView = UIStackView()
    infosContainerView.axis = .vertical
    infosContainerView.spacing = 8
    return infosContainerView
  }()

  // MARK: Lifecycle Methods

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func preferredLayoutAttributesFitting(
    _ layoutAttributes: UICollectionViewLayoutAttributes
  ) -> UICollectionViewLayoutAttributes {
    let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
    attributes.size.width = self.superview?.bounds.width ?? 0
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    data = nil
  }

  // MARK: Private Methods

  private func titleLabelSetupConstraints() {
    titleLabel.addConstraint(attribute: .left,
                             alignElement: contentView,
                             alignElementAttribute: .left,
                             constant: 16)
    titleLabel.addConstraint(attribute: .right,
                             alignElement: contentView,
                             alignElementAttribute: .right,
                             constant: 16)
    titleLabel.addConstraint(attribute: .top,
                             alignElement: contentView,
                             alignElementAttribute: .top,
                             constant: 0)
  }

  private func infosContainerViewSetupConstraints() {
    infosContainerView.addConstraint(attribute: .left,
                                     alignElement: contentView,
                                     alignElementAttribute: .left,
                                     constant: 16)
    infosContainerView.addConstraint(attribute: .right,
                                     alignElement: contentView,
                                     alignElementAttribute: .right,
                                     constant: 16)
    infosContainerView.addConstraint(attribute: .top,
                                     alignElement: titleLabel,
                                     alignElementAttribute: .bottom,
                                     constant: 16)
    infosContainerView.addConstraint(attribute: .bottom,
                                     alignElement: self,
                                     alignElementAttribute: .bottom,
                                     constant: 16)
  }

  private func setupInfos() {
    data?.infos.forEach({ info in
      let infoLabel = UILabel()
      infoLabel.font = .systemFont(ofSize: 16)
      infoLabel.textColor = .black
      infoLabel.text = info
      infosContainerView.addArrangedSubview(infoLabel)
    })
  }

}

// MARK: Methods of Code View

extension PokemonDetailsInfosCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(titleLabel)
    contentView.addSubview(infosContainerView)
  }

  func setupConstraints() {
    titleLabelSetupConstraints()
    infosContainerViewSetupConstraints()
  }

  func setupAditionalConfiguration() {
  }

}
