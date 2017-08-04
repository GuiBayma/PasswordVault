//
//  GroupManagerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupManagerTests: QuickSpec {

    override func spec() {

        describe("GroupManager tests") {

            var sut: GroupManager?
            var group: Group?
            var item: Item?

            beforeEach {
                sut = GroupManager.sharedInstance
            }

            afterEach {
                if let grp = group {
                    if let s = sut {
                        if !s.delete(object: grp) {
                            fail("could not delete Group")
                        }
                    }
                }
                if let item = item {
                    if !ItemManager.sharedInstance.delete(object: item) {
                        fail("could not delete item")
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should create a new group correctly") {
                group = sut?.newGroup()
                if !(sut?.save() ?? false) {
                    fail("could not save new Group")
                }
                expect(group).toNot(beNil())
            }

            it("should return all groups correctly") {
                group = sut?.newGroup()
                if !(sut?.save() ?? false) {
                    fail("could not save new Group")
                }
                let groups = sut?.getAllGroups()
                expect(groups?.count) >= 1
            }

            it("should save a new group correctly") {
                let count = sut?.getAllGroups().count ?? 0
                group = sut?.newGroup()
                _ = sut?.save()
                let newCount = sut?.getAllGroups().count
                expect(newCount) == count + 1
            }

            it("should delete the group correctly") {
                let groupCount = sut?.getAllGroups().count ?? 0
                let itemCount = ItemManager.sharedInstance.getAllItems().count

                group = sut?.newGroup()
                item = ItemManager.sharedInstance.newItem()
                if let item = item {
                    group?.addToItems(item)
                }

                if let group = group {
                    if let s = sut {
                        if !s.delete(object: group) {
                            fail("could not delete group")
                        }
                    }
                }

                let newGroupCount = sut?.getAllGroups().count
                let newItemCount = ItemManager.sharedInstance.getAllItems().count
                expect(newGroupCount) == groupCount
                expect(newItemCount) == itemCount
            }

        }

    }

}
