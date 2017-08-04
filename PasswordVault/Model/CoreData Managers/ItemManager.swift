//
//  ItemManager.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import CoreData

public class ItemManager: GenericManager {

    static let sharedInstance: ItemManager = ItemManager()
    static private let entityName = "Item"

    private override init() {}

    func newItem() -> Item? {
        if let context = managedContext {
            return NSEntityDescription.insertNewObject(forEntityName: ItemManager.entityName, into: context) as? Item
        }
        return nil
    }

    func getAllItems() -> [Item] {
        if let context = managedContext {
            let fetchRequest = NSFetchRequest<Item>(entityName: ItemManager.entityName)

            do {
                return try context.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        return [Item]()
    }

}
