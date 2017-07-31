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

        var sut: Group?

        describe("Group tests") {

            beforeEach {
                sut = Group()
                sut?.name = "Group 1"

                let item = Item()
                sut?.items = [item]
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should return 'Group 1' as the name of the group") {
                expect(sut?.name) == "Group 1"
            }

            it("should contain one item") {
                expect(sut?.items?.count) == 1
            }

        }
    }

}
