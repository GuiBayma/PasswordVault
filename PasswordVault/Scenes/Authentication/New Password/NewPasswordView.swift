//
//  NewPasswordView.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class NewPasswordView: UIView {

    // MARK: - Components
    
    let label            = UILabel()
    let labeledTextField = LabeledTextField()
    let button           = DoneButton()
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        self.addSubview(label)
        self.addSubview(labeledTextField)
        self.addSubview(button)
        
        setConstraints()
    }
    
    // MARK: - Constraints
    
    internal func setConstraints() {
        // Label
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(self).offset(80)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
        }
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        label.numberOfLines = 3
        label.text = "Escolha uma senha que será requisitada sempre que voltar ao aplicativo."
        label.textAlignment = .justified
        
        // Labeled Text Field
        labeledTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(label.snp.bottom).offset(15)
            maker.trailing.equalTo(label.snp.trailing)
            maker.leading.equalTo(label.snp.leading)
            maker.height.equalTo(60)
        }
        labeledTextField.label.text = "Senha"
        labeledTextField.textField.returnKeyType = .done
        labeledTextField.textField.isSecureTextEntry = true
        
        // Button
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(labeledTextField.snp.bottom).offset(10)
            maker.trailing.equalTo(labeledTextField.snp.trailing)
        }
        button.addTarget(self, action: #selector(self.registerButtonTouched(_:)), for: .touchUpInside)
    }
    
    // MARK: - Button action
    
    var buttonAction: (() -> Void)?
    
    internal func registerButtonTouched(_ sender: UIButton) {
        buttonAction?()
    }

}
