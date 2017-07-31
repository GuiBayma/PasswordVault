//
//  GroupsTableViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

enum GroupsNavigation {
    case newGroup
    case groupDetail
}

class GroupsTableViewController: UIViewController, UITableViewDelegate, NewGroupDelegate {

    // MARK: - Variables

    fileprivate let tableView = GenericTableView()
    fileprivate let dataSource = GroupsTableViewDataSource()

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

        self.navigationItem.title = "Senhas"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(self.addGroup(_:)))

        tableView.register(cellType: GroupTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource

        dataSource.tableView = tableView

        let group1 = Group()
        group1.name = "Group One"
        let item1 = Item()
        item1.name = "Item One"
        group1.items = [item1]
        dataSource.setData([group1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning: \(String(describing: type(of: self)))\n")
    }

    // MARK: - Table view delegte

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let selectedGroup = dataSource.getData(at: indexPath.item)
        navigate(destination: .groupDetail, group: selectedGroup)
    }

    // MARK: - New group delegate

    func addNewGroupAndDismiss(_ viewController: UIViewController, group: Group) {
        self.dataSource.addData(group)
        viewController.dismiss(animated: true) {}
    }

    // MARK: - Bar button items

    func addGroup(_ sender: UIBarButtonItem) {
        navigate(destination: .newGroup, group: nil)
    }

    // MARK: - Navigation

    func navigate(destination: GroupsNavigation, group: Group?) {
        switch destination {
        case .newGroup:
            let nextView = AddGroupViewController()
            nextView.delegate = self
            let navController = UINavigationController(rootViewController: nextView)
            self.present(navController, animated: true) {}
            break
        case .groupDetail:
            let nextView = GroupDetailTableViewController()
            nextView.group = group
            self.navigationController?.pushViewController(nextView, animated: true)
        }
    }

}
