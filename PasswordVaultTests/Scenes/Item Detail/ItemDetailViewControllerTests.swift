//
//  ItemDetailViewControllerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class ItemDetailViewControllerTests: QuickSpec {

    override func spec() {

        describe("ItemDetailViewController tests") {

            var sut: ItemDetailViewController?

            beforeEach {
                sut = ItemDetailViewController()
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = ItemDetailViewController(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

        }

    }

}
