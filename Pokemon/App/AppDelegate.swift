//
//  AppDelegate.swift
//  Pokemon
//
//  Created by Juliano Terres on 08/03/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: Pubic Variables

  var window: UIWindow?

  // MARK: Application

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    mainScreen()
    return true
  }

  // MARK: Private Methods

  private func mainScreen() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = MainRouter().build()
    window?.makeKeyAndVisible()
  }

  // MARK: Methods of CoreData

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Pokemon")
    container.loadPersistentStores(completionHandler: { (_, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
}
