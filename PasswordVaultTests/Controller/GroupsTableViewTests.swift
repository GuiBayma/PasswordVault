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
    var dataSource: GroupsTableViewDataSource?

    override func setUp() {
        super.setUp()
        groupsTableView = GroupsTableViewController()
        tableView = groupsTableView?.view as? GenericTableView
        dataSource = tableView?.dataSource as? GroupsTableViewDataSource
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTableViewLoaded() {
        XCTAssertNotNil(tableView, "table view must not be nil")
    }

    func testTableViewDataSource() {
        XCTAssertNotNil(dataSource, "table view data source must not be nil")
    }

    func testTableViewDelegate() {
        XCTAssertNotNil(tableView?.delegate, "table view delegate must not be nil")
        XCTAssertTrue(groupsTableView?.conforms(to: UITableViewDelegate.self) ?? false, "view must conform to UITableViewDelegate")
    }

    func testNumberOfSections() {
        XCTAssertTrue(tableView?.numberOfSections == 1, "table view must have 1 section")
    }

    func testNumberOfRows() {
        XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 3, "table view must have 3 rows in section 0")
    }
    
    func testAddNewGroup() {
        let group = Group()
        groupsTableView?.addNewGroup(group)
        XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 4, "table view must have 4 rows in section 0")
    }

    func testSelectRow() {
        XCTAssertTrue(tableView?.allowsSelection ?? false)
    }
    
    func testDeleteGroup() {
        dataSource?.tableView(tableView!, commit: .delete, forRowAt: IndexPath(item: 1, section: 0))
        XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 2, "table view must have 2 rows in section 0")
    }
    
}
