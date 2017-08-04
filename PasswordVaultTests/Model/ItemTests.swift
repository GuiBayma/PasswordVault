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

        describe("Item tests") {

            var sut: Item?
            let manager = ItemManager.sharedInstance

            beforeEach {
                sut = manager.newItem()
                sut?.name = "Item 1"
                sut?.userName = "User name"
                sut?.password = "Secret key"
            }

            afterEach {
                if let s = sut {
                    if !manager.delete(object: s) {
                        fail("could not delete Item")
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should return 'Item 1' as the name of the item") {
                expect(sut?.name) == "Item 1"
            }

            it("should return 'User name' as the user name of the item") {
                expect(sut?.userName) == "User name"
            }

            it("should return 'Secret key' as the password of the item") {
                expect(sut?.password) == "Secret key"
            }

        }

    }

}
