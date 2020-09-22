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
    
    func getUser(page: Int) {
        ApiClient.getUsers(page: page)
        .asObservable()
        .subscribe(onNext: { [weak self] data in
            self?.users.accept(data.users)
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
        })
        .disposed(by: disposeBag)
    }
}

