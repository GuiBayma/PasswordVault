//
//  GroupTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupTests: QuickSpec {

    override func spec() {

        describe("Group tests") {

            var sut: Group?
            var item: Item?
            let manager = GroupManager.sharedInstance

            beforeEach {
                sut = manager.newGroup()
                sut?.name = "Group 1"
                item = ItemManager.sharedInstance.newItem()
                _ = manager.save()
            }

            afterEach {
                if let s = sut {
                    if !manager.delete(object: s) {
                        fail("could not delete Group")
                    }
                }
                if let itm = item {
                    if !ItemManager.sharedInstance.delete(object: itm) {
                        fail("could not delete Item")
                    }
                }
            }

            afterSuite {
                if let itm = item {
                    if !ItemManager.sharedInstance.delete(object: itm) {
                        fail("could not delete Item")
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should return 'Group 1' as the name of the group") {
                expect(sut?.name) == "Group 1"
            }

            it("should add to items") {
                if let item = item {
                    sut?.addItem(item)
                }
                expect(sut?.items?.count) == 1
            }

            it("should remove from items") {
                if let item = item {
                    sut?.addItem(item)
                    sut?.removeItem(item)
                }
                expect(sut?.items?.count) == 0
            }

        }
    }

}
