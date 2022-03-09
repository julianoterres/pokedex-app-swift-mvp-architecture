//
//  UICollectionView+ReusableCell.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

extension UICollectionReusableView: ReusableView {}

extension UICollectionView {

  func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }

  func dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(forIndexPath  indexPath: IndexPath) -> T {
    guard let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                           withReuseIdentifier: T.defaultReuseIdentifier,
                                                           for: indexPath) as? T else {
      fatalError("Could not dequeue reusable supplementary with identifier: \(T.defaultReuseIdentifier)")
    }
    return view
  }

}
