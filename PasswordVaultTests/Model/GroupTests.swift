//
//  GroupTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class GroupTests: QuickSpec {

    override func spec() {
        
        var group: Group?
        
        describe("Group tests") {
            
            beforeEach {
                group = Group()
                group?.name = "Group 1"
                
                let item = Item()
                group?.items = [item]
            }
            
            it("should not be nil") {
                expect(group).toNot(beNil())
            }
            
            it("should return 'Group 1' as the name of the group") {
                expect(group?.name) == "Group 1"
            }
            
            it("should contain one item") {
                expect(group?.items?.count) == 1
            }
            
        }
    }

}
