//
//  SubscribeTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 21.10.2022.
//

import UIKit

/// Прототип ячейки подписки
final class SubscribeTableViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var subscribeButton: UIButton!
    
    // MARK: - Private Methods
    private func subscribe(isSubsribe: Bool) {
        subscribeButton.layer.cornerRadius = 5
        subscribeButton.titleLabel?.textAlignment = .center
        subscribeButton.layer.borderColor = UIColor.label.cgColor
        if isSubsribe {
            subscribeButton.tintColor = .clear
            subscribeButton.layer.borderWidth = 0.5
        } else {
            subscribeButton.tintColor = .tintColor
            subscribeButton.layer.borderWidth = 0
        }
    }
    
    // MARK: - Public Methods
    func updateData(_ item: Subcribe) {
        actionLabel.attributedText =
        NSMutableAttributedString()
            .bold("\(item.user.name) ")
            .normal("\(item.action) ")
            .normalGray("\(item.date)")
        avatarImageView.image = UIImage(named: item.user.avatar)
        subscribe(isSubsribe: item.isSubsribe)
    }
}
