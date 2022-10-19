//
//  NewsCell.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit
import NewsNetwork

fileprivate struct Constants {
    let hPadding: CGFloat = 16
    let vPadding: CGFloat = 6
    let spacing: CGFloat = 10
    let imageHeight: CGFloat = UIScreen.main.bounds.width * 0.65
}

public class NewsCell: NiblessTableViewCell {
    private let const = Constants()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var articleImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var vStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = const.spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public func configure(with article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
}

// MARK: - Layout
extension NewsCell {
    public override func constructHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(articleImageView)
        containerView.addSubview(vStack)
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(descriptionLabel)
    }
    
    public override func activateConstraints() {
        activateContainerViewConstraints()
        activateImageViewConstraints()
        activateVStackConstraints()
    }
    
    private func activateContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: const.vPadding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: const.hPadding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -const.hPadding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -const.vPadding),
        ])
    }
    
    private func activateImageViewConstraints() {
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            articleImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: const.imageHeight)
        ])
    }
    
    private func activateVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: articleImageView.bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
