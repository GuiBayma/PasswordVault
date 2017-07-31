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

            beforeEach {
                sut = GroupsTableViewDataSource()
                tableView.dataSource = sut
                tableView.register(cellType: GroupTableViewCell.self)
                sut?.tableView = tableView

                let group1 = Group()
                group1.name = "Group one"
                let group2 = Group()
                group2.name = "Group two"
                sut?.setData([group1, group2])
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should have 1 section") {
                expect(tableView.numberOfSections) == 1
            }

            it("should return the number of rows correctly") {
                expect(tableView.numberOfRows(inSection: 0)) == 2
            }

            it("should set the data correctly") {
                let group = Group()
                sut?.setData([group])
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should return the data correctly") {
                let group = sut?.getData(at: 0)
                expect(group?.name) == "Group one"
            }

            it("should add data correctly") {
                let group3 = Group()
                sut?.addData(group3)
                expect(tableView.numberOfRows(inSection: 0)) == 3
            }

            it("should return the cell correctly") {
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = sut?.tableView(tableView, cellForRowAt: indexPath) as? GroupTableViewCell
                expect(cell?.label.text) == "Group one"
            }

            it("should allow editing rows") {
                expect(sut?.tableView(tableView, canEditRowAt: IndexPath())).to(beTrue())
            }

            it("should remove data correctly") {
                let indexPath = IndexPath(row: 0, section: 0)
                sut?.tableView(tableView, commit: .delete, forRowAt: indexPath)
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

        }

    }

}
