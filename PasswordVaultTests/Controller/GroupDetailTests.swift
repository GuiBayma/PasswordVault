//
//  GroupDetailTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import XCTest
@testable import PasswordVault

class GroupDetailTests: XCTestCase {
    
    var detailTableView: GroupDetailTableViewController?
    var tableView: GenericTableView?
    var dataSource: GroupDetailTableViewDataSource?
    
    override func setUp() {
        super.setUp()
        detailTableView = GroupDetailTableViewController()
        
        let group = Group()
        let item = Item()
        group.items = [item]
        detailTableView?.group = group
        
        tableView = detailTableView?.view as? GenericTableView
        dataSource = tableView?.dataSource as? GroupDetailTableViewDataSource
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
        XCTAssertTrue(detailTableView?.conforms(to: UITableViewDelegate.self) ?? false, "view must conform to UITableViewDelegate")
    }
    
    func testNumberOfSections() {
        XCTAssertTrue(tableView?.numberOfSections == 1, "table view must have 1 section")
    }
    
    func testNumberOfRows() {
        XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 1, "table view must have 1 rows in section 0")
    }
    
    func testSelectRow() {
        XCTAssertTrue(tableView?.allowsSelection ?? false)
    }
    
}
