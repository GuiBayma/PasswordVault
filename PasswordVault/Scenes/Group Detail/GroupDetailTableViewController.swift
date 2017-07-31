//
//  GroupDetailTableViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

enum ItemsNavigation {
    case newItem
}

class GroupDetailTableViewController: UIViewController, UITableViewDelegate, NewDataDelegate {

    // MARK: - Variables

    fileprivate let tableView = GenericTableView()
    fileprivate let dataSource = GroupDetailTableViewDataSource()
    weak var group: Group?

    // MARK: - View initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = tableView
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = group?.name
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(self.addItem(_:)))

        tableView.register(cellType: ItemTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource

        dataSource.tableView = tableView
        dataSource.setData(group?.items ?? [])
    }

    // MARK: - Table view delegte

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - New data delegate

    func addNewDataAndDismiss(_ viewController: UIViewController, data: NSObject) {
        if let item = data as? Item {
            dataSource.addData(item)
        }
        viewController.dismiss(animated: true) {}
    }

    // MARK: - Bar button items

    func addItem(_ sender: UIBarButtonItem) {
        navigate(destination: .newItem, item: nil)
    }

    // MARK: - Navigation

    func navigate(destination: ItemsNavigation, item: Item?) {
        switch destination {
        case .newItem:
            let nextView = AddItemViewController()
            nextView.delegate = self
            let navController = UINavigationController(rootViewController: nextView)
            self.present(navController, animated: true) {}
        }
    }

}
