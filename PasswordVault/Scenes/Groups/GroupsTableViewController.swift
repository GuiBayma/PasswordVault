//
//  GroupsTableViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class GroupsTableViewController: UIViewController, UITableViewDelegate {

    // MARK: - Variables

    fileprivate let tableView = GenericTableView()
    fileprivate let dataSource = GroupsTableViewDataSource()

    // MARK: - View Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Senhas"
        tableView.register(cellType: GroupTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
        dataSource.tableView = tableView

        let group1 = Group()
        group1.name = "Group One"
        let group2 = Group()
        group2.name = "Group Two"
        let group3 = Group()
        group3.name = "Group Three"
        dataSource.setData([group1, group2, group3])
    }

    // TODO: Think about this
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning: \(String(describing: type(of: self)))\n")
    }

    // MARK: - Table view delegte

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
