//
//  UICollectionView+Register.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

extension UICollectionView {

  func register<T: ReusableView>(_: T.Type) {
    self.register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
  }

  func registerHeader<T: ReusableView>(_: T.Type) {
    self.register(T.self,
                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                  withReuseIdentifier: T.defaultReuseIdentifier)
  }

}
