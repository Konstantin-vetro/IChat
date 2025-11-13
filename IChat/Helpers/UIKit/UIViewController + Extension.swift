//
//  UIViewController + Extension.swift
//  IChat
//
//  Created by Гость on 11.11.2025.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfigureCell, U: Hashable>(
        collectionView: UICollectionView,
        cellType: T.Type,
        with model: U,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.reuseID, for: indexPath
        ) as? T else { fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: model)
        return cell
    }
}
