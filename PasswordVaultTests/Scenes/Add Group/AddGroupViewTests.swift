//
//  AddGroupViewTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class ButtonActionMock {

    var wasPressed = false

    func buttonAction() {
        wasPressed = true
    }

}

class AddGroupViewTests: QuickSpec {

    override func spec() {

        describe("AddGroupViewTests tests") {

            var sut: AddGroupView?
            var buttonActionMock: ButtonActionMock?

            beforeEach {
                sut = AddGroupView()
                buttonActionMock = ButtonActionMock()
                sut?.buttonAction = buttonActionMock?.buttonAction
            }

            it("shoul not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = AddGroupView(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

            it("should return true on button action") {
                sut?.button.sendActions(for: .touchUpInside)
                expect(buttonActionMock?.wasPressed).to(beTrue())
            }

        }

    }

}
