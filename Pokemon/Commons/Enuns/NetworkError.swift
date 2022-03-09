//
//  NetworkError.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

enum NetworkError: Error {
  case invalidURL
  case invalidRequest
  case noData
  case networkError(Error)
}
