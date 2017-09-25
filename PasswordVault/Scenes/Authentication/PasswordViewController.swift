//
//  PasswordViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variables
    
    fileprivate let passwordView = NewPasswordView()
    
    // MARK: - Initializing
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView() {
        self.view = passwordView
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordView.buttonAction = donePressed
        passwordView.labeledTextField.textField.delegate = self
        passwordView.label.text = "Digite a sua senha para acessar o aplicativo"
    }

    // MARK: - Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkPasswordAndDismiss()
        return true
    }
    
    // MARK: - Button action
    
    func donePressed() {
        checkPasswordAndDismiss()
    }
    
    // MARK: - Save new password
    
    func checkPasswordAndDismiss() {
        if let text = passwordView.labeledTextField.textField.text {
            if let password = UserDefaults.standard.string(forKey: "AppPasswordKey") {
                if password == text {
                    dismiss(animated: true) {
                        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                            appDelegate.didShowPasswordView = false
                        }
                    }
                } else {
                    showErrorAlert()
                }
            }
        }
    }
    
    // MARK: - Alert
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Erro", message: "Senha incorreta", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { alert in }
        alert.addAction(action)
        present(alert, animated: true) {}
    }

}
