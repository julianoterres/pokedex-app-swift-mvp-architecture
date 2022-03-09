//
//  PokemonCell.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

// MARK: Methods of PokemonCell

class PokemonCell: UICollectionViewCell {

  // MARK: Public Properties

  var data: PokemonCellViewModel? {
    didSet {
      titleLabel.text = data?.name.capitalized
      imageView.downloaded(url: data?.imageURL)
    }
  }

  // MARK: Views

  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 8
    containerView.shadow(opaccity: 0.7, offSet: CGSize(width: 0, height: 0), radius: 4, color: .black)
    return containerView
  }()

  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = .systemFont(ofSize: 12)
    titleLabel.textColor = .black
    titleLabel.textAlignment = .center
    return titleLabel
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
    attributes.size.width = ((self.superview?.bounds.width ?? 0) / 3) - 24
    return attributes
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    data = nil
  }

  // MARK: Private Methods

  private func containerViewSetupConstraints() {
    containerView.addConstraint(attribute: .left,
                                alignElement: contentView,
                                alignElementAttribute: .left,
                                constant: 0)
    containerView.addConstraint(attribute: .right,
                                alignElement: contentView,
                                alignElementAttribute: .right,
                                constant: 0)
    containerView.addConstraint(attribute: .top,
                                alignElement: contentView,
                                alignElementAttribute: .top,
                                constant: 0)
    containerView.addConstraint(attribute: .bottom,
                                alignElement: contentView,
                                alignElementAttribute: .bottom,
                                constant: 0)
  }

  private func imageViewSetupConstraints() {
    imageView.addConstraint(attribute: .left,
                            alignElement: containerView,
                            alignElementAttribute: .left,
                            constant: 8)
    imageView.addConstraint(attribute: .right,
                            alignElement: containerView,
                            alignElementAttribute: .right,
                            constant: 8)
    imageView.addConstraint(attribute: .top,
                            alignElement: containerView,
                            alignElementAttribute: .top,
                            constant: 8)
    imageView.addConstraint(attribute: .height,
                            constant: 75)
  }

  private func titleLabelSetupConstraints() {
    titleLabel.addConstraint(attribute: .left,
                             alignElement: containerView,
                             alignElementAttribute: .left,
                             constant: 16)
    titleLabel.addConstraint(attribute: .right,
                             alignElement: containerView,
                             alignElementAttribute: .right,
                             constant: 16)
    titleLabel.addConstraint(attribute: .top,
                             alignElement: imageView,
                             alignElementAttribute: .bottom,
                             constant: 0)
    titleLabel.addConstraint(attribute: .bottom,
                             alignElement: containerView,
                             alignElementAttribute: .bottom,
                             constant: 16)
  }

}

// MARK: Methods of Code View

extension PokemonCell: CodeView {

  func buildViewHierarchy() {
    contentView.addSubview(containerView)
    containerView.addSubview(imageView)
    containerView.addSubview(titleLabel)
  }

  func setupConstraints() {
    containerViewSetupConstraints()
    imageViewSetupConstraints()
    titleLabelSetupConstraints()
  }

  func setupAditionalConfiguration() {
  }

}
