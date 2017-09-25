//
//  AppDelegate.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgroundView: BackgroundView?
    var didShowPasswordView = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Debug
        let groups = GroupManager.sharedInstance.getAllGroups()
        print("\(groups.count) groups found\n")
//        for group in groups {
//            _ = GroupManager.sharedInstance.delete(object: group)
//        }
        
        let items = ItemManager.sharedInstance.getAllItems()
        print("\(items.count) items found\n")
//        for item in items {
//            _ = GroupManager.sharedInstance.delete(object: item)
//        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        backgroundView = BackgroundView(frame: window?.frame ?? CGRect())

        let mainView = GroupsTableViewController()
        let navController = UINavigationController(rootViewController: mainView)

        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        guard
            let bView = backgroundView,
            didShowPasswordView != true
        else {
            return
        }
        if let topController = UIApplication.topViewController() {
            let topView = topController.view
            topView?.addSubview(bView)
        }
        UIApplication.shared.ignoreSnapshotOnNextApplicationLaunch()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        if didShowPasswordView {
            return
        }
        if let topController = UIApplication.topViewController() {
            if let _ = UserDefaults.standard.string(forKey: "AppPasswordKey") {
                let passView = PasswordViewController()
                topController.present(passView, animated: false) {
                    self.backgroundView?.removeFromSuperview()
                    self.didShowPasswordView = true
                }
            } else {
                let newPassView = NewPasswordViewController()
                topController.present(newPassView, animated: false) {
                    self.backgroundView?.removeFromSuperview()
                }
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PasswordVault")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
