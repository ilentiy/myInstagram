//
//  DetailTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Прототип подробной информации профиля
final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var activityLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var subscribeButton: UIButton!
    @IBOutlet private weak var directButton: UIButton!
    @IBOutlet private weak var recomendationButton: UIButton!
    
    // MARK: - Public Methods
    func updateData(_ user: User) {
        nameLabel.text = user.detailInfo?.alias
        activityLabel.text = user.detailInfo?.activity
        descriptionLabel.text = user.detailInfo?.description
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        recomendationButton.layer.borderColor = UIColor.gray.cgColor
        recomendationButton.layer.borderWidth = 1
        directButton.layer.borderColor = UIColor.gray.cgColor
        directButton.layer.borderWidth = 1
    }
}
