//
//  GroupsTableViewCellTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupsTableViewCellTests: QuickSpec {

    override func spec() {

        describe("GroupsTableViewCell tests") {

            var sut: GroupTableViewCell?
            let group = GroupManager.sharedInstance.newGroup()

            beforeEach {
                sut = GroupTableViewCell()
            }

            afterSuite {
                if let grp = group {
                    if !GroupManager.sharedInstance.delete(object: grp) {
                        fail("could not delete group")
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = GroupTableViewCell(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

            it("should configure correctly") {
                guard let group = group else {
                    fail("group is nil")
                    return
                }
                group.name = "Group name"

                sut?.configure(group)
                expect(sut?.label.text) == group.name
            }

        }

    }

}
