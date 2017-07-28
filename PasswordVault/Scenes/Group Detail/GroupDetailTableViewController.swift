//
//  GroupDetailTableViewController.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 7/27/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit

class GroupDetailTableViewController: UIViewController, UITableViewDelegate {

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
        
        tableView.register(cellType: ItemTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
        
        dataSource.tableView = tableView
        dataSource.setData(group?.items ?? [])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning: \(String(describing: type(of: self)))\n")
    }
    
    // MARK: - Table view delegte
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation


}
