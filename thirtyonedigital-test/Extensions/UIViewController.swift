//
//  UIViewController.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/23/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var activityIndicatorTag: Int { return 100 }
    
    func showLoading() {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.center = view.center
        indicator.tag = self.activityIndicatorTag
        indicator.hidesWhenStopped = true
        
        indicator.startAnimating()
        view.addSubview(indicator)
    }

    func dismissLoading() {
        if let activityIndicator = self.view.subviews.filter(
        { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
