//
//  LabeledTextField.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class LabeledTextField: UIView {

    // MARK: - Components

    let label       = UILabel()
    let textField   = UITextField()
    let lineView    = UIView()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(lineView)

        setConstraints()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        // Label
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(self)
            maker.left.equalTo(self)
        }
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)

        // TextField
        textField.snp.makeConstraints { (maker) in
            maker.top.equalTo(label.snp.bottom).offset(10)
            maker.left.equalTo(self)
            maker.right.equalTo(self)
        }
        textField.autocorrectionType = .no

        // Line
        lineView.snp.makeConstraints { (maker) in
            maker.top.equalTo(textField.snp.bottom).offset(1)
            maker.leading.equalTo(textField.snp.leading)
            maker.trailing.equalTo(textField.snp.trailing)
            maker.height.equalTo(1)
        }
        lineView.backgroundColor = .black
    }

}
