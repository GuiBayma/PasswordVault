//
//  ItemDetailView.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class ItemDetailView: UIView {

    // MARK: - Components

    let nameLabel       = UILabel()
    let userLabel       = UILabel()
    let passwordLabel   = UILabel()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        self.addSubview(nameLabel)
        self.addSubview(userLabel)
        self.addSubview(passwordLabel)

        setConstraints()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        // name label
        nameLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(userLabel.snp.top).offset(-40)
            maker.centerX.equalTo(userLabel.snp.centerX)
        }
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)

        // user name label
        userLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(self.snp.centerX)
            maker.centerY.equalTo(self.snp.centerY)
        }
        userLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)

        // password label
        passwordLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(userLabel.snp.bottom).offset(20)
            maker.centerX.equalTo(userLabel.snp.centerX)
        }
        passwordLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
    }

}
