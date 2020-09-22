//
//  ViewController.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/22/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import UIKit
import RxSwift

final class UsersTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = UserTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        viewModel.getUser(page: 1)
        setupTableView()
    }
    
    private func setupUI() {

    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserTableViewCell.className)
        
        viewModel.users
            .bind(to: tableView.rx.items(cellIdentifier: UserTableViewCell.className, cellType: UserTableViewCell.self)) { (row, element, cell) in
                cell.setupCell(user: element)
            }
            .disposed(by: viewModel.disposeBag)
    }
}

