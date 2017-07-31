//
//  ItemTableViewCellTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class ItemTableViewCellTests: QuickSpec {

    override func spec() {

        describe("ItemTableViewCell tests") {

            var sut: ItemTableViewCell?

            beforeEach {
                sut = ItemTableViewCell()
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = ItemTableViewCell(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

            it("should configure correctly") {
                let item = Item()
                item.name = "Item name"

                sut?.configure(item)
                expect(sut?.label.text) == item.name
            }

        }

    }

}
