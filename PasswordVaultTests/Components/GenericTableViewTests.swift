//
//  GenericTableViewTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GenericTableViewTests: QuickSpec {

    override func spec() {

        var tableView: GenericTableView?

        describe("LabeledTextField tests") {

            tableView = GenericTableView()

            it("should not be nil") {
                expect(tableView).toNot(beNil())
            }

            it("should not load through storyboard") {
                expect {
                    _ = GenericTableView(coder: NSCoder())
                    }.to(throwAssertion())
            }

        }

    }

}
