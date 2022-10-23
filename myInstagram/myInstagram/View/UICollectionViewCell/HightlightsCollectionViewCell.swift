//
//  HightlightsCollectionViewCell.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Прототип одного  хайлайта
final class HightlightsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var hightlightLabel: UILabel!
    @IBOutlet private weak var hightlightImageView: UIImageView!
    
    // MARK: - Public Methods
    func updateData(hightlight: Hightlight) {
        hightlightLabel.text = hightlight.name
        hightlightImageView.image = UIImage(named: hightlight.imageName)
    }
}
