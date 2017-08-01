//
//  AddItemView.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/31/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class AddItemView: UIView {

    // MARK: - Components

    let nameLabeledTextField     = LabeledTextField()
    let userLabeledTextField     = LabeledTextField()
    let passwordLabeledTextField = LabeledTextField()
    let button = DoneButton()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        self.addSubview(nameLabeledTextField)
        self.addSubview(userLabeledTextField)
        self.addSubview(passwordLabeledTextField)
        self.addSubview(button)

        setConstraints()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        // name labeled textfield
        setNameLabeledConstraints()

        // user labeled textfield
        setUserLabeledConstraints()

        // password labeled textfield
        setPasswordLabeledConstraints()

        // button
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordLabeledTextField.snp.bottom).offset(10)
            maker.trailing.equalTo(passwordLabeledTextField.snp.trailing)
        }
        button.addTarget(self, action: #selector(registerButtonTouched(_:)), for: .touchUpInside)
    }

    internal func setNameLabeledConstraints() {
        nameLabeledTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(self).offset(80)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
            maker.height.equalTo(60)
        }
        nameLabeledTextField.label.text = "Nome do item"
        nameLabeledTextField.textField.returnKeyType = .next
    }

    internal func setUserLabeledConstraints() {
        userLabeledTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(nameLabeledTextField.snp.bottom).offset(15)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
            maker.height.equalTo(60)
        }
        userLabeledTextField.label.text = "Usuário"
        userLabeledTextField.textField.returnKeyType = .next
    }

    internal func setPasswordLabeledConstraints() {
        passwordLabeledTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(userLabeledTextField.snp.bottom).offset(15)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
            maker.height.equalTo(60)
        }
        passwordLabeledTextField.label.text = "Senha"
        passwordLabeledTextField.textField.returnKeyType = .done
        passwordLabeledTextField.textField.isSecureTextEntry = true
    }

    // MARK: - Button action

    var buttonAction: (() -> Void)?

    internal func registerButtonTouched(_ sender: UIButton) {
        buttonAction?()
    }

}
