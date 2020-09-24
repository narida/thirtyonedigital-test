//
//  UserTableViewCell.swift
//  thirtyonedigital-test
//
//  Created by Elisha Narida on 9/23/20.
//  Copyright © 2020 Elisha Narida. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func setupCell(user: User) {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        emailLabel.text = user.email
        avatarImageView.sd_setImageWithFade(url: URL(string: user.avatar), placeholderImage: UIImage(named: "placeholder")) { _ in
            self.avatarImageView.contentMode = .scaleAspectFill
        }
    }
}
