//
//  AddGroupViewControllerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/28/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class NewGroupDelegateMock: NewGroupDelegate {
    
    var group: Group?
    
    func addNewGroup(_ group: Group) {
        self.group = group
    }
}

class AddGroupViewControllerTests: QuickSpec {
    
    override func spec() {
        
        describe("AddGroupViewController tests") {
            
            var addGroupController: AddGroupViewController?
            var newGroupDelegateMock: NewGroupDelegateMock?
            
            beforeEach {
                addGroupController = AddGroupViewController()
                newGroupDelegateMock = NewGroupDelegateMock()
                addGroupController?.delegate = newGroupDelegateMock
                
                if let view = addGroupController?.view as? AddGroupView {
                    let textField = view.labeledTextField.textField
                    textField.text = "New Group"
                } else {
                    fail("view should be AddGroupView")
                }
            }
            
            it("should not be nil") {
                expect(addGroupController).toNot(beNil())
            }
            
            it("should not load through storyboard") {
                expect {
                    _ = AddGroupViewController(coder: NSCoder())
                }.to(throwAssertion())
            }
            
            it("should conform to UITextFieldDelegate") {
                expect(addGroupController?.conforms(to: UITextFieldDelegate.self)).to(beTrue())
            }
            
            it("should dismiss and create new group through text field return") {
                let textField = (addGroupController?.view as! AddGroupView).labeledTextField.textField
                
                expect(addGroupController?.textFieldShouldReturn(textField)).to(beTrue())
                
//                waitUntil { done in
//                    expect(addGroupController?.isBeingDismissed).toEventually(beTrue())
//                    done()
//                }
                expect(newGroupDelegateMock?.group?.name) == "New Group"
            }
            
            it("should dismiss and create new group through button action") {
                addGroupController?.donePressed()
                expect(newGroupDelegateMock?.group?.name) == "New Group"
            }
            
            it("should dismiss and not create new group for empty string") {
                if let view = addGroupController?.view as? AddGroupView {
                    let textField = view.labeledTextField.textField
                    textField.text = ""
                    expect(addGroupController?.textFieldShouldReturn(textField)).to(beTrue())
                    expect(newGroupDelegateMock?.group).to(beNil())
                } else {
                    fail("view should be AddGroupView")
                }
            }
        }
        
    }
    
}
