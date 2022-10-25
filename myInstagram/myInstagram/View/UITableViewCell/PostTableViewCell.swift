//
//  PostTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 18.10.2022.
//

import UIKit

/// Прототип поста
final class PostTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    enum Identifiers {
        static let post = "Post"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var postCollectionView: UICollectionView!
    
    // MARK: - Public Property
    var posts: [String]?
}

/// UICollectionViewDataSource
extension PostTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = posts?.count else { return 0 }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let post = posts?[indexPath.row],
              let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Identifiers.post,
                for: indexPath
              ) as? PostsCollectionViewCell
        else { return UICollectionViewCell() }
        cell.updateData(post: post)
        return cell
    }
}

/// UICollectionViewDelegate
extension PostTableViewCell: UICollectionViewDelegate {}
