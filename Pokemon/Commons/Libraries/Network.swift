//
//  Network.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import Alamofire
import Foundation

// MARK: Methods of NetworkProtocol

protocol NetworkProtocol {
  func request(url: Endpoint,
               method: HTTPMethod,
               parameters: Parameters?,
               complete: @escaping (Result<Data, Error>) -> Void)
}

// MARK: Methods of Network

class Network: NetworkProtocol {

  func request(url: Endpoint,
               method: HTTPMethod,
               parameters: Parameters?,
               complete: @escaping (Result<Data, Error>) -> Void) {

    guard var url = URLComponents(string: url.path)else {
      complete(.failure(NetworkError.invalidURL))
      return
    }

    var parameters = parameters

    if method == .get {
      let queryItens = parameters?.compactMap { URLQueryItem(name: $0.key, value: ($0.value as? String)) }
      url.queryItems = queryItens
      parameters = nil
    }

    AF.request(url, method: method, parameters: parameters).validate().responseData { response in
      switch response.result {
      case .success:
        guard let data = response.data else {
          complete(.failure(NetworkError.noData))
          return
        }
        complete(.success(data))
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

}
