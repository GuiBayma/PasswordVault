//
//  AddItemViewControllerTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/31/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import PasswordVault

class NewItemDelegateMock: NewDataDelegate {

    var item: Item?

    func addNewDataAndDismiss(_ viewController: UIViewController, data: NSObject) {
        if let item = data as? Item {
            self.item = item
        }
        viewController.dismiss(animated: true) {}
    }
}

class AddItemViewControllerTests: QuickSpec {

    override func spec() {

        describe("AddItemViewController tests") {

            var sut: AddItemViewController?
            var newItemDelegateMock: NewItemDelegateMock?

            beforeEach {
                sut = AddItemViewController()
                newItemDelegateMock = NewItemDelegateMock()
                sut?.delegate = newItemDelegateMock

                if let view = sut?.view as? AddItemView {
                    let textField1 = view.nameLabeledTextField.textField
                    textField1.text = "New item"
                    let textField2 = view.userLabeledTextField.textField
                    textField2.text = "User name"
                    let textField3 = view.passwordLabeledTextField.textField
                    textField3.text = "Password"
                } else {
                    fail("view should be AddItemView")
                }
            }

            it("should not be nil") {
                expect(sut).toNot(beNil())
            }

            #if arch(x86_64) && _runtime(_ObjC) && !SWIFT_PACKAGE
                it("should not load through storyboard") {
                    expect {
                        _ = AddItemViewController(coder: NSCoder())
                    }.to(throwAssertion())
                }
            #endif

            it("should conform to UITextFieldDelegate") {
                expect(sut?.conforms(to: UITextFieldDelegate.self)).to(beTrue())
            }

            it("should create create a new item") {
                sut?.saveNewItemAndDismiss()
                let item = newItemDelegateMock?.item
                expect(item?.name) == "New item"
                expect(item?.userName) == "User name"
                expect(item?.password) == "Password"
            }

        }

    }

}
