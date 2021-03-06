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

        var sut: GenericTableView?

        describe("GenericTableView tests") {

            sut = GenericTableView()

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = GenericTableView(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

        }

    }

}
