//
//  UIViewController+Navigation.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit

extension UIViewController {

  func setupNavigation(color: UIColor, titleColor: UIColor) {
    if #available(iOS 15, *) {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.shadowImage = UIImage()
      appearance.shadowColor = .clear
      appearance.backgroundColor = color
      appearance.titleTextAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
        NSAttributedString.Key.foregroundColor: titleColor
      ]
      navigationController?.navigationBar.standardAppearance = appearance
      navigationController?.navigationBar.scrollEdgeAppearance = appearance
    } else {
      navigationController?.navigationBar.shadowImage = UIImage()
      navigationController?.navigationBar.isTranslucent = false
      navigationController?.navigationBar.barTintColor = color
      navigationController?.navigationBar.titleTextAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
        NSAttributedString.Key.foregroundColor: titleColor
      ]
    }
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationController?.navigationBar.tintColor = .black
  }

}
