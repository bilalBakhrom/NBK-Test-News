//
//  ViewController+Addition.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import UIKit
import NewsNetwork

extension UIViewController {
    public func setNavTitle(_ title: String) {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .theme.accent
        label.text = title
        
        navigationItem.titleView = label
    }
    
    
    public func showError(_ error: NError) {
        let alert = UIAlertController(
            title: "Something went wrong",
            message: "Please check your internet and try again later",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}
