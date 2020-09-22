//
//  ViewController.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/22/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import UIKit

final class UsersTableViewController: UIViewController {
    
    private let viewModel = UserTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getUser(page: 1)
    }
}

