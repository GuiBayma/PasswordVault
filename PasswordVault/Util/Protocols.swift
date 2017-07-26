//
//  Protocols.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

protocol Configurable {
    
    associatedtype T
    func configure(_: T)
    
}
