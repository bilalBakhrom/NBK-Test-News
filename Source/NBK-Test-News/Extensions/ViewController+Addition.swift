//
//  ViewController+NavBar.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import UIKit

extension UIViewController {
    public func setNavTitle(_ title: String) {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .theme.accent
        label.text = title
        
        navigationItem.titleView = label
    }
}
