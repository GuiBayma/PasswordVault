//
//  Group.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import CoreData

@objc(Group)
public class Group: NSManagedObject {

    func addItem(_ item: Item) {
        if let newSet = items?.adding(item) as NSSet? {
            self.items = newSet
        }
        _ = GroupManager.sharedInstance.save()
    }

    func removeItem(_ item: Item) {
        if var itemsArray = items?.allObjects as? [Item] {
            itemsArray.removeItem(item)
            self.items = NSSet(array: itemsArray)
        }
        _ = GroupManager.sharedInstance.save()
    }
}

extension Group {

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}
