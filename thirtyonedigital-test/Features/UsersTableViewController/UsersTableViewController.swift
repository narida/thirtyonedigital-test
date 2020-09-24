//
//  ViewController.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/22/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class UsersTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = UserTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.setupNetwork()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: UserTableViewCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserTableViewCell.className)
        tableView.rx.setDelegate(self).disposed(by: viewModel.disposeBag)
        
        viewModel.isLoading
             .asObservable()
             .distinctUntilChanged()
             .subscribe(
                 onNext: { [weak self] isLoading in
                    _ = isLoading ? self?.showLoading() : self?.dismissLoading()
                 }
             )
             .disposed(by: viewModel.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.users
        .bind(to: tableView.rx.items(cellIdentifier: UserTableViewCell.className, cellType: UserTableViewCell.self)) { (row, element, cell) in
            cell.setupCell(user: element)
        }
        .disposed(by: viewModel.disposeBag)
    }
}

extension UsersTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 0 && viewModel.didReachedEnd {
            viewModel.loadUsers()
        }
    }
}
