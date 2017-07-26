//
//  GroupTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import XCTest
@testable import PasswordVault

class GroupTests: XCTestCase {

    var group: Group?

    override func setUp() {
        super.setUp()
        group = Group()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGroupNotNil() {
        XCTAssertNotNil(group, "group must not be nil")
    }

    func testSetValuesInGroup () {
        group?.name = "Group 1"

        XCTAssertEqual(group?.name, "Group 1")
    }

}
