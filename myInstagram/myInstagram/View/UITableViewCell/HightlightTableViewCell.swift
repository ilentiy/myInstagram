//
//  HightlightTableViewCell.swift
//  myInstagram
//
//  Created by Илья on 23.10.2022.
//

import UIKit

/// Прототип Хайлатов
final class HightlightTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    enum Identifiers {
        static let hightlights = "Highlight"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Public Property
    var hightlights: [Hightlight]?
}

/// UICollectionViewDataSource
extension HightlightTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = hightlights?.count else { return 0}
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let hightlight = hightlights?[indexPath.row],
              let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: Identifiers.hightlights,
                for: indexPath
              ) as? HightlightsCollectionViewCell
        else { return UICollectionViewCell() }
        cell.updateData(hightlight: hightlight)
        return cell
    }
}
