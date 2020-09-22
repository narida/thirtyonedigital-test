//
//  Constants.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/22/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation

struct Constants {

    static var baseURL: String {
        guard let url = Bundle.main.infoDictionary!["Base URL"] as? String else {
            return ""
        }
        return url
    }
    
    struct Parameters {
        static let page = "page"
    }
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
