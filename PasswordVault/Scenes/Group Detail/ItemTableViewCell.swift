//
//  ItemTableViewCell.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit
import Reusable

class ItemTableViewCell: UITableViewCell, Configurable, Reusable {

    // MARK: - Components

    var label = UILabel()

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(label)

        setConstraints()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        label.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self)
            maker.left.equalTo(self).offset(20)
            maker.right.equalTo(self).offset(-20)
        }
    }

    // MARK: - Configuration

    func configure(_ item: Item) {
        label.text = item.name
    }

}
