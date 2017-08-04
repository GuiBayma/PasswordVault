//
//  GroupsTableViewDataSourceTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupsTableViewDataSourceTests: QuickSpec {

    override func spec() {

        describe("GroupsTableViewDataSource tests") {

            var sut: GroupsTableViewDataSource?
            let tableView = UITableView()
            var group1: Group?
            var group2: Group?

            beforeEach {
                sut = GroupsTableViewDataSource()
                tableView.dataSource = sut
                tableView.register(cellType: GroupTableViewCell.self)
                sut?.tableView = tableView
            }

            beforeSuite {
                group1 = GroupManager.sharedInstance.newGroup()
                group2 = GroupManager.sharedInstance.newGroup()
                guard
                    let group1 = group1,
                    let group2 = group2
                else {
                    fail("group is nil")
                    return
                }
                group1.name = "Group one"
                group2.name = "Group two"
            }

            afterSuite {
                guard
                    let group1 = group1,
                    let group2 = group2
                else {
                    fail("group is nil")
                    return
                }
                if !GroupManager.sharedInstance.delete(object: group1) {
                    fail("could not delete group")
                }
                if !GroupManager.sharedInstance.delete(object: group2) {
                    fail("could not delete group")
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should have 1 section") {
                expect(tableView.numberOfSections) == 1
            }

            it("should set the data correctly") {
                if let group1 = group1 {
                    sut?.setData([group1])
                }
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should return the data correctly") {
                if let group1 = group1 {
                    sut?.setData([group1])
                }
                let group = sut?.getData(at: 0)
                expect(group?.name) == "Group one"
            }

            it("should add data correctly") {
                if let group2 = group2 {
                    sut?.addData(group2)
                }
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should return the cell correctly") {
                if let group2 = group2 {
                    sut?.addData(group2)
                }
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = sut?.tableView(tableView, cellForRowAt: indexPath) as? GroupTableViewCell
                expect(cell?.label.text) == "Group two"
            }

            it("should allow editing rows") {
                expect(sut?.tableView(tableView, canEditRowAt: IndexPath())).to(beTrue())
            }

            it("should remove data correctly") {
                if let group1 = group1 {
                    sut?.setData([group1])
                }
                let indexPath = IndexPath(row: 0, section: 0)
                sut?.tableView(tableView, commit: .delete, forRowAt: indexPath)
                expect(tableView.numberOfRows(inSection: 0)) == 0
            }

        }

    }

}
