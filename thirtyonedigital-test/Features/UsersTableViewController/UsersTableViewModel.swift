//
//  UsersTableViewModel.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/22/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class UserTableViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    var users = BehaviorRelay<[User]>(value: [])
    var didReachedEnd = false
    private var page = 0
    
    let isLoading = BehaviorRelay<Bool>(value: false)
    let error = BehaviorRelay<Error?>(value: nil)
    
    func loadUsers() {
        isLoading.accept(true)
        didReachedEnd = false
        getUser()
    }
    
    func getUser() {
        page += 1
        ApiClient.getUsers(page: page)
        .asObservable()
        .subscribe(onNext: { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.users.accept(strongSelf.users.value + data.users)
            strongSelf.didReachedEnd = data.users.count <= data.total
            self?.isLoading.accept(false)
        }, onError: { error in
            switch error {
            case ApiError.conflict:
                print("Conflict error")
            case ApiError.forbidden:
                print("Forbidden error")
            case ApiError.notFound:
                print("Not found error")
            default:
                print("Unknown error:", error)
            }
            self.isLoading.accept(false)
        })
        .disposed(by: disposeBag)
    }
}

