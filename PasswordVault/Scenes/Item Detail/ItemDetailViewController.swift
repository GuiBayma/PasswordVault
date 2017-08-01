//
//  ItemDetailViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    // MARK: - Variables

    fileprivate let itemDetailView = ItemDetailView()
    var item: Item?

    // MARK: - Initializing

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func loadView() {
        self.view = itemDetailView
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLabels()
    }

    // MARK: - Set up labels

    func setUpLabels() {
        itemDetailView.nameLabel.text = item?.name
        itemDetailView.userLabel.text = item?.userName
        itemDetailView.passwordLabel.text = item?.password
    }

}
