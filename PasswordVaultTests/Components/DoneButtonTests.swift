//
//  DoneButtonTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/31/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class DoneButtonTests: QuickSpec {

    override func spec() {

        describe("DoneButton tests") {

            var sut: DoneButton?

            beforeEach {
                sut = DoneButton()
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = DoneButton(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

        }

    }

}
