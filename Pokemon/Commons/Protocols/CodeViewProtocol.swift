//
//  CodeViewProtocol.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

protocol CodeView {
  func buildViewHierarchy()
  func setupConstraints()
  func setupAditionalConfiguration()
  func setupView()
}

extension CodeView {

  func setupView() {
    buildViewHierarchy()
    setupConstraints()
    setupAditionalConfiguration()
  }

}
