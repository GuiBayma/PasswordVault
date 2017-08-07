//
//  Extensions.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation

extension Array where Element : Item {

    mutating func removeItem(_ item: Item) {
        var i = 0
        for itm in self {
            if itm == item {
                break
            }
            i += 1
        }
        self.remove(at: i)
    }

}
