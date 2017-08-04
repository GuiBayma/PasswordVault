//
//  GroupManager.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import CoreData

public class GroupManager: GenericManager {

    static let sharedInstance: GroupManager = GroupManager()
    static private let entityName = "Group"

    private override init() {}

    func newGroup() -> Group? {
        if let context = managedContext {
            return NSEntityDescription.insertNewObject(forEntityName: GroupManager.entityName, into: context) as? Group
        }
        return nil
    }

    func getAllGroups() -> [Group] {
        if let context = managedContext {
            let fetchRequest = NSFetchRequest<Group>(entityName: GroupManager.entityName)

            do {
                return try context.fetch(fetchRequest)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        return [Group]()
    }

}
