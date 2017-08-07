//
//  GroupDetailTableViewDataSource.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import CoreData

class GroupDetailTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: - Variables

    fileprivate var data: [NSManagedObject] = []
    weak var tableView: UITableView?

    // MARK: - Set Data

    func setData(_ data: [NSManagedObject]) {
        self.data = data
        tableView?.reloadData()
    }

    // MARK: - Add data

    func addData(_ item: Item) {
        data.append(item)
        tableView?.reloadData()
    }

    // MARK: - Get data

    func getData(at index: Int) -> Item? {
        if let item = data[index] as? Item {
            return item
        }
        return nil
    }
    
    // MARK: - Delete data

    fileprivate func removeDataAt(_ indexPath: IndexPath) {
        let item = data[indexPath.item]
        if ItemManager.sharedInstance.delete(object: item) {
            data.remove(at: indexPath.item)
            tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Data Source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for:indexPath) as ItemTableViewCell
        if let item = data[indexPath.item] as? Item {
            cell.configure(item)
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
