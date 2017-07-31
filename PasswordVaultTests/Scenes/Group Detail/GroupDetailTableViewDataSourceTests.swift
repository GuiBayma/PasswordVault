//
//  GroupDetailTableViewDataSourceTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupDetailTableViewDataSourceTests: QuickSpec {

    override func spec() {

        describe("GroupDetailTableViewDataSource tests") {

            var sut: GroupDetailTableViewDataSource?
            let tableView = UITableView()

            beforeEach {
                sut = GroupDetailTableViewDataSource()
                tableView.dataSource = sut
                tableView.register(cellType: ItemTableViewCell.self)
                sut?.tableView = tableView

                let item1 = Item()
                item1.name = "Item one"
                let item2 = Item()
                item2.name = "Item two"
                sut?.setData([item1, item2])
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
                let item = Item()
                sut?.setData([item])
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should return the cell correctly") {
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = sut?.tableView(tableView, cellForRowAt: indexPath) as? ItemTableViewCell
                expect(cell?.label.text) == "Item one"
            }
        }

    }

}
