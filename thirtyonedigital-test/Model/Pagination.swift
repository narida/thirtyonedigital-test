//
//  Pagination.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/23/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation
import RxSwift

struct Pagination: Codable {
    
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case users = "data"
    }
    
}
