//
//  GroupTableViewCell.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit
import Reusable

class GroupTableViewCell: UITableViewCell, Configurable, Reusable {

    // MARK: - Outlets

    var label = UILabel()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(label)

        configureConstraints()
    }

    // MARK: - Constraints

    func configureConstraints() {
        label.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
        }
    }

    // MARK: - Configuration

    func configure(_ group: Group) {
        label.text = group.name
    }

}
