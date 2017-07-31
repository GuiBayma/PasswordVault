//
//  GroupsTableViewControllerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupsTableViewControllerTests: QuickSpec {

    override func spec() {

        describe("GroupsTableViewController tests") {

            var sut: GroupsTableViewController?

            beforeEach {
                sut = GroupsTableViewController()
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = GroupsTableViewController(coder: NSCoder())
                        }.to(throwAssertion())
                }
            #endif

            it("should conform to UITableViewDelegate") {
                expect(sut?.conforms(to: UITableViewDelegate.self)).to(beTrue())
            }

        }

    }

}
