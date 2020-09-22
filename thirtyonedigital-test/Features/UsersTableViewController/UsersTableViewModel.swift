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

class UserTableViewModel: NSObject {
    
    private let disposeBag = DisposeBag()
    
    func getUser(page: Int) {
        ApiClient.getUsers(page: page)
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { users in
            print(users)
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

