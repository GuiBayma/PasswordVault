//
//  AddGroupViewTests.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import XCTest
@testable import PasswordVault

class AddGroupViewTests: XCTestCase {

    var addGroupView: AddGroupViewController?

    override func setUp() {
        super.setUp()
        addGroupView = AddGroupViewController()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewLoaded() {
        XCTAssertNotNil(addGroupView?.view, "view must not be nil")
    }

    func testComformsToTextfieldDelegate() {
        XCTAssertTrue(addGroupView?.conforms(to: UITextFieldDelegate.self) ?? false, "view must conform to UITextFieldDelegate")
    }
    
    func testSaveNewGroupThroughTextfieldReturn() {
        if let view = addGroupView?.view as? AddGroupView {
            let textfield = view.labeledTextField.textField
//            textfield.text = "Test"
            
            let shouldReturn = addGroupView?.textFieldShouldReturn(textfield)
            XCTAssertTrue(shouldReturn ?? false)
        } else {
            XCTFail("view must be AddGroupView")
        }
    }
    
}
