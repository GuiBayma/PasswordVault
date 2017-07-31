//
//  AddGroupView.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class AddGroupView: UIView {

    // MARK: - Components

    let labeledTextField = LabeledTextField()
    let button           = DoneButton()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        self.addSubview(labeledTextField)
        self.addSubview(button)

        setConstraints()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        // label + textfield
        labeledTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(self).offset(80)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
            maker.height.equalTo(60)
        }
        labeledTextField.label.text = "Nome do grupo"
        labeledTextField.textField.returnKeyType = .done

        // button
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(labeledTextField.snp.bottom).offset(10)
            maker.trailing.equalTo(labeledTextField.snp.trailing)
        }
        button.addTarget(self, action: #selector(registerButtonTouched(_:)), for: .touchUpInside)
    }

    // MARK: - Button action

    var buttonAction: (() -> Void)?

    internal func registerButtonTouched(_ sender: UIButton) {
        buttonAction?()
    }
}
