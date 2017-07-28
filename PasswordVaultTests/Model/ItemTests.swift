//
//  ItemTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class ItemTests: QuickSpec {
    
    override func spec() {
        
        var item: Item?
        
        describe("Item tests") {
            
            beforeEach {
                item = Item()
                item?.name = "Item 1"
                item?.userName = "User name"
                item?.password = "Secret key"
            }
            
            it("should not be nil") {
                expect(item).toNot(beNil())
            }
            
            it("should return 'Item 1' as the name of the item") {
                expect(item?.name) == "Item 1"
            }
            
            it("should return 'User name' as the user name of the item") {
                expect(item?.userName) == "User name"
            }
            
            it("should return 'Secret key' as the password of the item") {
                expect(item?.password) == "Secret key"
            }
            
        }
        
    }
    
}
