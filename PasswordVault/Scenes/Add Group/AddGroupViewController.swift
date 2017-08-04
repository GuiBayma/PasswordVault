//
//  AddGroupViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class AddGroupViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variables

    fileprivate let addGroupView = AddGroupView()
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
        self.view = addGroupView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                target: self,
                                                                action: #selector(self.cancelPressed(_:)))

        addGroupView.labeledTextField.textField.delegate = self
        addGroupView.labeledTextField.textField.becomeFirstResponder()
        addGroupView.buttonAction = donePressed
    }

    // MARK: - Bar button items

    func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }

    // MARK: - Text field delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        saveNewGroupAndDismiss()
        return true
    }

    // MARK: - Button action

    func donePressed() {
        addGroupView.labeledTextField.textField.resignFirstResponder()
        saveNewGroupAndDismiss()
    }

    // MARK: - Save new group

    func saveNewGroupAndDismiss() {
        guard
            let text = addGroupView.labeledTextField.textField.text
        else {
            fatalError("\(String(describing: type(of: self))): Error retrieving text from textfield")
        }
        if text == "" {
            dismiss(animated: true) {}
        } else {
            let newGroup = GroupManager.sharedInstance.newGroup()
            newGroup?.name = text
            if let group = newGroup {
                _ = GroupManager.sharedInstance.save()
                self.delegate?.addNewDataAndDismiss(self, data: group)
            } else {
                dismiss(animated: true) {}
            }
        }
    }

}
