//
//  MessageTableViewCell.swift
//  SortingSampleApp
//
//  Created by Tomas Cejka on 8/27/19.
//  Copyright © 2019 STRV. All rights reserved.
//

import UIKit

final class MessageTableViewCell: UITableViewCell {

    @IBOutlet private weak var messageTitleLabel: UILabel! {
        didSet {
            messageTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
            messageTitleLabel.textColor = .black
        }
    }
    @IBOutlet private weak var messageTextLabel: UILabel! {
        didSet {
            messageTextLabel.font = UIFont.systemFont(ofSize: 13)
            messageTextLabel.textColor = .gray
        }
    }

    override func prepareForReuse() {
        // reset content
        messageTitleLabel.text = ""
        messageTextLabel.text = ""
    }

    func set(title: String, message: String) {
        // set with values
        messageTitleLabel.text = title
        messageTextLabel.text = message
    }
}
