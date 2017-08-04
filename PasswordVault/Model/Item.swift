//
//  Item.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

}

extension Item {

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var userName: String?
    @NSManaged public var group: Group?

}
