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
            var item1: Item?
            var item2: Item?

            beforeEach {
                sut = GroupDetailTableViewDataSource()
                tableView.dataSource = sut
                tableView.register(cellType: ItemTableViewCell.self)
                sut?.tableView = tableView
            }

            beforeSuite {
                item1 = ItemManager.sharedInstance.newItem()
                item2 = ItemManager.sharedInstance.newItem()
                guard
                    let item1 = item1,
                    let item2 = item2
                    else {
                        fail("item is nil")
                        return
                }
                item1.name = "Item one"
                item2.name = "Item two"
            }

            afterSuite {
                guard
                    let item1 = item1,
                    let item2 = item2
                else {
                    fail("item is nil")
                    return
                }
                if !ItemManager.sharedInstance.delete(object: item1) {
                    fail("could not delete item")
                }
                if !ItemManager.sharedInstance.delete(object: item2) {
                    fail("could not delete item")
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            it("should have 1 section") {
                expect(tableView.numberOfSections) == 1
            }

            it("should set the data correctly") {
                if let item1 = item1 {
                    sut?.setData([item1])
                }
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should add data correctly") {
                if let item2 = item2 {
                    sut?.addData(item2)
                }
                expect(tableView.numberOfRows(inSection: 0)) == 1
            }

            it("should return the data correctly") {
                if let item1 = item1 {
                    sut?.setData([item1])
                }
                let item = sut?.getData(at: 0)
                expect(item?.name) == "Item one"
            }

            it("should return the cell correctly") {
                if let item2 = item2 {
                    sut?.addData(item2)
                }
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = sut?.tableView(tableView, cellForRowAt: indexPath) as? ItemTableViewCell
                expect(cell?.label.text) == "Item two"
            }

            it("should allow editing rows") {
                expect(sut?.tableView(tableView, canEditRowAt: IndexPath())).to(beTrue())
            }

            it("should remove data correctly") {
                if let item1 = item1 {
                    sut?.setData([item1])
                }
                let indexPath = IndexPath(row: 0, section: 0)
                sut?.tableView(tableView, commit: .delete, forRowAt: indexPath)
                expect(tableView.numberOfRows(inSection: 0)) == 0
            }
        }

    }

}
