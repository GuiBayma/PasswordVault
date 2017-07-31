//
//  GroupDetailTableViewDataSource.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class GroupDetailTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Variables

    fileprivate var data: [Item] = []
    weak var tableView: UITableView?

    // MARK: - Set Data

    func setData(_ data: [Item]) {
        self.data = data
        tableView?.reloadData()
    }

    // MARK: - Add data

    func addData(_ item: Item) {
        data.append(item)
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
        let cell = tableView.dequeueReusableCell(for:indexPath) as ItemTableViewCell
        cell.configure(item)
        return cell
    }

}
