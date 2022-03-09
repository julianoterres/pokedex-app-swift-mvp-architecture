//
//  UIView+Shadow.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

extension UIView {

  func shadow(opaccity: Float, offSet: CGSize, radius: CGFloat, color: UIColor) {
    clipsToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opaccity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
  }

  func removeShadow() {
    clipsToBounds = true
    layer.shadowColor = UIColor.clear.cgColor
    layer.shadowOpacity = 0
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 0
  }

}
