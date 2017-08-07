//
//  Extensions.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

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

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
