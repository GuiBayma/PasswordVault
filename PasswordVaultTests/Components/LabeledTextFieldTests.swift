//
//  LabeledTextFieldTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class LabeledTextFieldTests: QuickSpec {

    override func spec() {

        var labeledTextField: LabeledTextField?

        describe("LabeledTextField tests") {

            labeledTextField = LabeledTextField()

            it("should not be nil") {
                expect(labeledTextField).toNot(beNil())
            }

            it("should not load through storyboard") {
                expect {
                    _ = LabeledTextField(coder: NSCoder())
                    }.to(throwAssertion())
            }

        }

    }

}
