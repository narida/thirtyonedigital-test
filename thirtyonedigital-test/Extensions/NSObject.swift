//
//  NSObject.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/23/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
