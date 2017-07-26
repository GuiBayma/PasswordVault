//
//  GroupsTableViewTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import XCTest
@testable import PasswordVault

class GroupsTableViewTests: XCTestCase {

    var groupsTableView: GroupsTableViewController?
    var tableView: GenericTableView?

    override func setUp() {
        super.setUp()
        groupsTableView = GroupsTableViewController()
        tableView = groupsTableView?.view as? GenericTableView
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTableViewLoaded() {
        XCTAssertNotNil(groupsTableView?.view, "table view must not be nil")
    }

    func testTableViewDataSource() {
        XCTAssertNotNil(tableView?.dataSource, "table view data source must not be nil")
    }

    func testTableViewDelegate() {
        XCTAssertTrue(groupsTableView?.conforms(to: UITableViewDelegate.self) ?? false, "view must conform to UITableViewDelegate")
        XCTAssertNotNil(tableView?.delegate, "table view delegate must not be nil")
    }

    func testNumberOfSections() {
        XCTAssertTrue(tableView?.numberOfSections == 1, "table view must have 1 section")
    }

    func testNumberOfRows() {
        XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 3, "table view must have 3 rows in section 0")
    }

}
