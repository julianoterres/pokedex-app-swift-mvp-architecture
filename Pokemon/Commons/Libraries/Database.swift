//
//  Database.swift
//  Pokemon
//
//  Created by Juliano Terres on 09/03/22.
//

import UIKit
import CoreData

// MARK: Methods of DatabaseProtocol

protocol DatabaseProtocol {
  var context: NSManagedObjectContext { get }
  func save(complete: @escaping (Result<Void, Error>) -> Void)
  func get<T: NSManagedObject>(entity: T.Type,
                               query: NSPredicate,
                               complete: @escaping (Result<[NSFetchRequestResult], Error>) -> Void)
  func get<T: NSManagedObject>(entity: T.Type,
                               complete: @escaping (Result<[NSFetchRequestResult], Error>) -> Void)
  func delete<T: NSManagedObject>(entity: T.Type,
                                  query: NSPredicate,
                                  complete: @escaping (Result<Void, Error>) -> Void)
}

// MARK: Methods of Database

class Database {

  private(set) var context: NSManagedObjectContext

  init() {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    context = appDelegate!.persistentContainer.viewContext
  }

}

// MARK: Methods of DatabaseProtocol

extension Database: DatabaseProtocol {

  func save(complete: @escaping (Result<Void, Error>) -> Void) {
    do {
      try context.save()
      complete(.success(()))
    } catch let error {
      complete(.failure(error))
    }
  }

  func delete<T: NSManagedObject>(entity: T.Type,
                                  query: NSPredicate,
                                  complete: @escaping (Result<Void, Error>) -> Void) {
    get(entity: entity, query: query) { [weak self] result in
      switch result {
      case .success(let objects):
        guard let objects = objects as? [NSManagedObject] else {
          complete(.failure(NetworkError.noData))
          return
        }
        do {
          objects.forEach { object in self?.context.delete(object) }
          try self?.context.save()
          complete(.success(()))
        } catch let error {
          complete(.failure(error))
        }
      case .failure(let error):
        complete(.failure(error))
      }
    }
  }

  func get<T: NSManagedObject>(entity: T.Type,
                               query: NSPredicate,
                               complete: @escaping (Result<[NSFetchRequestResult], Error>) -> Void) {
    let fetchRequest = T.fetchRequest()
    fetchRequest.predicate = query
    do {
      let objects = try context.fetch(fetchRequest)
      complete(.success(objects))
    } catch let error {
      complete(.failure(error))
    }
  }

  func get<T: NSManagedObject>(entity: T.Type,
                               complete: @escaping (Result<[NSFetchRequestResult], Error>) -> Void) {
    let fetchRequest = T.fetchRequest()
    do {
      let objects = try context.fetch(fetchRequest)
      complete(.success(objects))
    } catch let error {
      complete(.failure(error))
    }
  }

}
