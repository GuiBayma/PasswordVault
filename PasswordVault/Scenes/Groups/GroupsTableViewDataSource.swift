//
//  GroupsTableViewDataSource.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import CoreData

class GroupsTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Variables

    fileprivate var data: [NSManagedObject] = []
    weak var tableView: UITableView?

    // MARK: - Set Data

    func setData(_ data: [NSManagedObject]) {
        self.data = data
        tableView?.reloadData()
    }

    // MARK: - Return data

    func getData(at index: Int) -> Group? {
        if let group = data[index] as? Group {
            return group
        }
        return nil
    }

    // MARK: - Add data

    func addData(_ group: Group) {
        data.append(group)
        tableView?.reloadData()
    }

    // MARK: - Delete data

    fileprivate func removeDataAt(_ indexPath: IndexPath) {
        data.remove(at: indexPath.item)
        tableView?.deleteRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for:indexPath) as GroupTableViewCell
        if let group = data[indexPath.item] as? Group {
            cell.configure(group)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeDataAt(indexPath)
        }
    }

}
