//
//  PokemonDetailsImageCell.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonDetailsImageCell

class PokemonDetailsImageCell: UICollectionViewCell {

  // MARK: Public Properties

  var data: PokemonDetailsImageCellViewModel? {
    didSet {
      imageView.downloaded(url: data?.imageURL)
    }
  }

  // MARK: Views

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
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
    attributes.size.height = 250
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    data = nil
    imageView.image = nil
  }

  // MARK: Private Methods

  private func imageViewSetupConstraints() {
    imageView.addConstraint(attribute: .left,
                            alignElement: contentView,
                            alignElementAttribute: .left,
                            constant: 0)
    imageView.addConstraint(attribute: .right,
                            alignElement: contentView,
                            alignElementAttribute: .right,
                            constant: 0)
    imageView.addConstraint(attribute: .top,
                            alignElement: contentView,
                            alignElementAttribute: .top,
                            constant: 0)
    imageView.addConstraint(attribute: .bottom,
                            alignElement: contentView,
                            alignElementAttribute: .bottom,
                            constant: 0)
  }

}

// MARK: Methods of Code View

extension PokemonDetailsImageCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(imageView)
  }

  func setupConstraints() {
    imageViewSetupConstraints()
  }

  func setupAditionalConfiguration() {
  }

}
