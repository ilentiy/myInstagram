//
//  ProfileTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Прототип шапки профиля
final class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var postNumberLabel: UILabel!
    @IBOutlet private weak var subscribersNumberLabel: UILabel!
    @IBOutlet private weak var subscriptionsNumberLabel: UILabel!
    
    // MARK: - Public Methods
    func updateData(_ user: User) {
        postNumberLabel.text = user.mainInfo?.post
        subscribersNumberLabel.text = user.mainInfo?.subscriber
        subscriptionsNumberLabel.text = user.mainInfo?.subscription
        avatarImageView.image = UIImage(named: user.avatar)
    }
}
