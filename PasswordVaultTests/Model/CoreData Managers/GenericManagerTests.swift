//
//  GenericManagerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GenericManagerTests: QuickSpec {

    override func spec() {

        describe("GenericManager tests") {

            var sut: GenericManager?

            beforeEach {
                sut = GenericManager()
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

        }

    }

}
