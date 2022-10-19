//
//  List+Deque.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit

// MARK: - Table View
public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: cellClass.cellIdentifier, for: indexPath) as! T
    }
}

// MARK: - Collection View
public extension UICollectionView {
    /// Dequeue reusable UICollectionViewCell using class name.
    ///
    /// - Parameters:
    ///   - cellClass: BaseCollectionViewCell type.
    ///   - indexPath: location of cell in collectionView.
    /// - Returns: UICollectionViewCell object with associated class name.
    func dequeueReusableCell<C: UICollectionViewCell>(_ cellClass: C.Type, for indexPath: IndexPath) -> C {
        dequeueReusableCell(withReuseIdentifier: cellClass.uid, for: indexPath) as! C
    }
    
    /// Dequeue reusable UICollectionReusableView using class name.
    ///
    /// - Parameters:
    ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
    ///   - name: UICollectionReusableView type.
    ///   - indexPath: location of cell in collectionView.
    /// - Returns: UICollectionReusableView object with associated class name.
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        ofKind kind: String,
        withClass name: T.Type,
        for indexPath: IndexPath
    ) -> T {
        dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: name),
            for: indexPath
        ) as! T // swiftlint:disable:this force_cast
    }
}
