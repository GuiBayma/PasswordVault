//
//  NewPasswordViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Variables
    
    fileprivate let newPasswordView = NewPasswordView()

    // MARK: - Initializing
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        self.view = newPasswordView
    }
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        newPasswordView.buttonAction = donePressed
        newPasswordView.labeledTextField.textField.delegate = self
    }
    
    // MARK: - Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveNewPasswordAndDismiss()
        return true
    }
    
    // MARK: - Button action
    
    func donePressed() {
        saveNewPasswordAndDismiss()
    }
    
    // MARK: - Save new password
    
    func saveNewPasswordAndDismiss() {
        if let text = newPasswordView.labeledTextField.textField.text {
            UserDefaults.standard.set(text, forKey: "AppPasswordKey")
            UserDefaults.standard.synchronize()
            dismiss(animated: true) {}
        }
    }

}
