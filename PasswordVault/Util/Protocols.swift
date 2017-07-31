//
//  Protocols.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

protocol Configurable {

    associatedtype ObjectType
    func configure(_: ObjectType)

}

protocol NewGroupDelegate: class {
    func addNewGroupAndDismiss(_ viewController: UIViewController, group: Group)
}

// TODO: Think about this
//protocol MemoryWarningComformable {
//    func didReceiveMemoryWarning()
//}
//
//extension UIViewController: MemoryWarningComformable {
//    override func didReceiveMemoryWarning() {
//        print("didReceiveMemoryWarning: \(String(describing: type(of: self)))\n")
//    }
//}
