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
            let item = ItemManager.sharedInstance.newItem()

            beforeEach {
                sut = ItemTableViewCell()
            }

            afterSuite {
                if let itm = item {
                    if !ItemManager.sharedInstance.delete(object: itm) {
                        fail("could not delete Item")
                    }
                }
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
                guard let item = item else {
                    fail("item is nil")
                    return
                }
                item.name = "Item name"

                sut?.configure(item)
                expect(sut?.label.text) == item.name
            }

        }

    }

}
