//
//  GroupsTableViewDataSource.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/26/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class GroupsTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Variables

    fileprivate var data: [Group] = []
    weak var tableView: UITableView?

    // MARK: - Set Data

    func setData(_ data: [Group]) {
        self.data = data
    }

    // MARK: - Add data

    func addData(_ group: Group) {
        data.append(group)
        tableView?.reloadData()
    }

    // MARK: - Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.item]
        let cell = tableView.dequeueReusableCell(for:indexPath) as GroupTableViewCell
        cell.configure(item)
        return cell
    }

}
