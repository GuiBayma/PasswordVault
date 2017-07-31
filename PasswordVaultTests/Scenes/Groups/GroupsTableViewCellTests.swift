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

            beforeEach {
                sut = GroupTableViewCell()
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
                let group = Group()
                group.name = "Group name"

                sut?.configure(group)
                expect(sut?.label.text) == group.name
            }

        }

    }

}
