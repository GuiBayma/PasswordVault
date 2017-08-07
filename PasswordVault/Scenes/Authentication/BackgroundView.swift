//
//  BackgroundView.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/7/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import SnapKit

class BackgroundView: UIView {

    // MARK: - Outlets
    
    let label = UILabel()
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.addSubview(label)
        
        configureLabel()
    }
    
    // MARK: - Label
    
    func configureLabel() {
        label.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(self)
            maker.centerX.equalTo(self)
        }
        label.text = "Password Vault"
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightRegular)
    }

}
