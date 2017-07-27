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
    weak var delegate: NewGroupDelegate?

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning: \(String(describing: type(of: self)))\n")
    }

    // MARK: - Bar button items

    func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }

    // MARK: - Text field delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveNewGroup()
        return true
    }

    // MARK: - Button action

    func donePressed() {
        saveNewGroup()
    }

    // MARK: - Save new group

    func saveNewGroup() {
        if let text = addGroupView.labeledTextField.textField.text {
            addGroupView.labeledTextField.textField.resignFirstResponder()

            if text == "" {
                dismiss(animated: true) {}
            } else {
                let newGroup = Group()
                newGroup.name = text
                dismiss(animated: true) {
                    self.delegate?.addNewGroup(newGroup)
                }
            }

        } else {
            fatalError("\(String(describing: type(of: self))): Error retrieving text from textfield")
        }
    }

}
