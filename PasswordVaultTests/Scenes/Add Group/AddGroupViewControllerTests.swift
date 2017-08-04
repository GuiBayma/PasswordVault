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

class NewGroupDelegateMock: NewDataDelegate {

    var group: Group?

    func addNewDataAndDismiss(_ viewController: UIViewController, data: NSObject) {
        if let group = data as? Group {
            self.group = group
        }
        viewController.dismiss(animated: true) {}
    }
}

class AddGroupViewControllerTests: QuickSpec {

    override func spec() {

        describe("AddGroupViewController tests") {

            var sut: AddGroupViewController?
            var newGroupDelegateMock: NewGroupDelegateMock?

            beforeEach {
                sut = AddGroupViewController()
                newGroupDelegateMock = NewGroupDelegateMock()
                sut?.delegate = newGroupDelegateMock

                if let view = sut?.view as? AddGroupView {
                    let textField = view.labeledTextField.textField
                    textField.text = "New Group"
                } else {
                    fail("view should be AddGroupView")
                }
            }

            afterEach {
                if let mock = newGroupDelegateMock {
                    if let group = mock.group {
                        if !GroupManager.sharedInstance.delete(object: group) {
                            fail("could not delete group")
                        }
                    }
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = AddGroupViewController(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

            it("should conform to UITextFieldDelegate") {
                expect(sut?.conforms(to: UITextFieldDelegate.self)).to(beTrue())
            }

            it("should dismiss and create new group through text field return") {
                guard
                    let textField = (sut?.view as? AddGroupView)?.labeledTextField.textField
                else {
                    fail("textfield should not be nil")
                    return
                }
                expect(sut?.textFieldShouldReturn(textField)).to(beTrue())
                expect(newGroupDelegateMock?.group?.name) == "New Group"
            }

            it("should dismiss and create new group through button action") {
                sut?.donePressed()
                expect(newGroupDelegateMock?.group?.name) == "New Group"
            }

            it("should dismiss and not create new group for empty string") {
                if let view = sut?.view as? AddGroupView {
                    let textField = view.labeledTextField.textField
                    textField.text = ""
                    expect(sut?.textFieldShouldReturn(textField)).to(beTrue())
                    expect(newGroupDelegateMock?.group).to(beNil())
                } else {
                    fail("view should be AddGroupView")
                }
            }
        }

    }

}
