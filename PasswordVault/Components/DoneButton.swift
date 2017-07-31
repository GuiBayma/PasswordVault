//
//  DoneButton.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/31/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class DoneButton: UIButton {

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setConstraints()
        setProperties()
    }

    // MARK: - Constraints

    internal func setConstraints() {
        self.snp.makeConstraints { (maker) in
            maker.height.equalTo(40)
            maker.width.equalTo(100)
        }
    }

    // MARK: - Properties

    internal func setProperties() {
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
        self.setTitle("Concluído", for: .normal)
    }

}
