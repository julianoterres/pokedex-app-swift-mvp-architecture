//
//  UIImageView+Download.swift
//  DigioTest
//
//  Created by Juliano Terres on 07/03/22.
//

import UIKit

extension UIImageView {

  func downloaded(url: URL?, contentMode mode: ContentMode = .scaleAspectFit) {
    guard let url = url, url.absoluteString.contains("http") else {
      image = UIImage(named: url?.absoluteString ?? "")
      return
    }
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data) else {
              return
            }
      DispatchQueue.main.async { [weak self] in
        self?.image = image
      }
    }.resume()
  }

}
