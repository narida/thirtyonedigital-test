//
//  UIImageView.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/23/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {

    func sd_setImageWithFade(url: URL?, placeholderImage placeholder: UIImage?, completion: ((UIImage?) -> Void)? = nil) {
        self.sd_setImage(with: url, placeholderImage: placeholder) { (image, _, cacheType, _) -> Void in
            if let downLoadedImage = image {
                if cacheType == .none {
                    self.alpha = 0
                    UIView.transition(with: self, duration: 0.2, options: UIView.AnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                        self.image = downLoadedImage
                        self.alpha = 1
                    }, completion: nil)
                }
            } else {
                self.image = placeholder
            }
            completion?(image)
        }
    }
}
