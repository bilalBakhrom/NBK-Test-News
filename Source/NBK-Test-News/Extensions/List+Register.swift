//
//  List+Register.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit

// MARK: - Table View
public extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

public extension UITableView {
    /// Register UITableViewCell using class name.
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the collectionView cell.
    ///   - name: UITableViewCell type.
    func registerNib<T: UITableViewCell>(_ cellClass: T.Type) {
        register(UINib(nibName: cellClass.cellIdentifier, bundle: nil), forCellReuseIdentifier: cellClass.cellIdentifier)
    }
    
    /// Register UITableViewCell using class name.
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the collectionView cell.
    ///   - name: UITableViewCell type.
    func register<T: UITableViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellReuseIdentifier: name.cellIdentifier)
    }
    
    /// Register UITableViewCell using class name.
    ///
    /// - Parameter cellClass: UITableViewCell type.
    func register(_ cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.cellIdentifier)
    }
}

// MARK: - Collection View
public extension UICollectionViewCell {
    static var uid: String {
        return String(describing: self)
    }
}

public extension UICollectionView {
    /// Register UICollectionReusableView using class name.
    ///
    /// - Parameters:
    ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
    ///   - name: UICollectionReusableView type.
    func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
    
    /// Register UICollectionViewCell using class name.
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the collectionView cell.
    ///   - name: UICollectionViewCell type.
    func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellWithReuseIdentifier: name.uid)
    }
    
    /// Register UICollectionViewCell using class name.
    ///
    /// - Parameter name: UICollectionViewCell type.
    func register<T: UICollectionViewCell>(_ name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: name.uid)
    }
    /// Register UICollectionReusableView using class name.
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the reusable view.
    ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
    ///   - name: UICollectionReusableView type.
    func register<T: UICollectionReusableView>(
        nib: UINib?,
        forSupplementaryViewOfKind kind: String,
        withClass name: T.Type
    ) {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
    
    func registerNib<T: UICollectionViewCell>(_ name: T.Type)  {
        register(UINib(nibName: name.uid, bundle: nil), forCellWithReuseIdentifier: name.uid)
    }
}

