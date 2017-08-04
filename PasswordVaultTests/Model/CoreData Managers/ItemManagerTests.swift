//
//  ItemManagerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class ItemManagerTests: QuickSpec {

    override func spec() {

        describe("ItemManager tests") {

            var sut: ItemManager?
            var item: Item?

            beforeEach {
                sut = ItemManager.sharedInstance
            }

            afterEach {
                if let itm = item {
                    if let s = sut {
                        if !s.delete(object: itm) {
                            fail("Could not delete Item")
                        }
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should create a new item correctly") {
                item = sut?.newItem()
                expect(item).toNot(beNil())
            }

            it("should return all items correctly") {
                item = sut?.newItem()
                if !(sut?.save() ?? false) {
                    fail("could not save new Item")
                }
                let items = sut?.getAllItems()
                expect(items?.count) >= 1
            }

            it("should save a new item correctly") {
                let count = sut?.getAllItems().count ?? 0

                item = sut?.newItem()
                _ = sut?.save()

                let newCount = sut?.getAllItems().count
                expect(newCount) == count + 1
            }

            it("should delete the item correctly") {
                let count = sut?.getAllItems().count ?? 0
                item = sut?.newItem()
                _ = sut?.save()

                if let item = item {
                    if let s = sut {
                        if !s.delete(object: item) {
                            fail("could not delete item")
                        }
                    }
                }

                let newCount = sut?.getAllItems().count ?? 0
                expect(count) == newCount
            }
        }

    }

}
