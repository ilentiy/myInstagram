//
//  PostsCollectionViewCell.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Прототип ячейки поста
final class PostsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: - Public Methods
    func updateData(post: String) {
        postImageView.image = UIImage(named: post)
    }
}
