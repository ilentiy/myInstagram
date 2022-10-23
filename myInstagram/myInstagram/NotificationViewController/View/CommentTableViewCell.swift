//
//  CommentTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 20.10.2022.
//

import UIKit

/// Прототип ячейки комментария
final class CommentTableViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var actionLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: - Public Methods
    func updateData(_ item: Comment) {
        actionLabel.attributedText =
            NSMutableAttributedString()
            .bold("\(item.user.name) ")
            .normal("\(item.action) ")
            .normalGray("\(item.date)")
        avatarImageView.image = UIImage(named: item.user.avatar)
        postImageView.image = UIImage(named: item.post)
    }

}
