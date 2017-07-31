//
//  AddItemViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/31/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variables

    fileprivate let addItemView = AddItemView()
    fileprivate var textFields: [UITextField] = []
    weak var delegate: NewDataDelegate?

    // MARK: - Initializing

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    // MARK: - View lifecycle

    override func loadView() {
        self.view = addItemView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                target: self,
                                                                action: #selector(self.cancelPressed(_:)))

        addItemView.buttonAction = donePressed
        setUpTextFields()
        startInput()
    }

    // MARK: - Bar button items

    func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }

    // MARK: - Text Fields

    func setUpTextFields() {
        textFields.append(addItemView.nameLabeledTextField.textField)
        textFields.append(addItemView.userLabeledTextField.textField)
        textFields.append(addItemView.passwordLabeledTextField.textField)

        for field in textFields {
            field.delegate = self
        }
    }

    // MARK: - Input

    func startInput() {
        textFields.first?.becomeFirstResponder()
    }

    // MARK: - Text Field Delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let index = textFields.index(of: textField) {
            if index < textFields.count - 1 {
                let nextTextField = textFields[index + 1]
                nextTextField.becomeFirstResponder()
            } else {
                saveNewItemAndDismiss()
            }
        }
        return true
    }

    // MARK: - Button action

    func donePressed() {
        for field in textFields {
            field.resignFirstResponder()
        }
        saveNewItemAndDismiss()
    }

    // MARK: - Save new Item

    func saveNewItemAndDismiss() {
        guard
            let name = textFields[0].text,
            let user = textFields[1].text,
            let pwd  = textFields[2].text
        else {
            fatalError("\(String(describing: type(of: self))): Error retrieving text from textfield")
        }
        if name == "" {
            dismiss(animated: true) {}
        } else {
            let newItem = Item()
            newItem.name = name
            newItem.userName = user
            newItem.password = pwd
            delegate?.addNewDataAndDismiss(self, data: newItem)
        }
    }

}
