//
//  NewsCell.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit
import NewsNetwork
import NukeUI

fileprivate struct Constants {
    let hPadding: CGFloat = 16
    let vPadding: CGFloat = 6
    let spacing: CGFloat = 10
    let cornerRadius: CGFloat = 10
}

public class NewsCell: NiblessTableViewCell {
    private let const = Constants()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .theme.primaryBackground
        view.layer.cornerRadius = const.cornerRadius
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var articleImageView: LazyImageView = {
        let view = LazyImageView()
        view.placeholderView = UIActivityIndicatorView()
        view.layer.cornerRadius = const.cornerRadius
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.white
        view.numberOfLines = 3
        view.font = .systemFont(ofSize: 15, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.textColor = UIColor.white.withAlphaComponent(0.7)
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textAlignment = .right
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.textColor = UIColor.white.withAlphaComponent(0.85)
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textAlignment = .right
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
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
    
    private lazy var vStackInfo: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = const.spacing / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public func configure(with article: Article) {
        articleImageView.url = article.urlToImage
        titleLabel.text = article.title
        authorLabel.text = article.author
        dateLabel.text = article.readableDate
    }
}

// MARK: - Layout
extension NewsCell {
    public override func constructHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(articleImageView)
        containerView.addSubview(gradientView)
        containerView.addSubview(vStack)
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(vStackInfo)
        vStackInfo.addArrangedSubview(dateLabel)
        vStackInfo.addArrangedSubview(authorLabel)
    }
    
    public override func activateConstraints() {
        activateContainerViewConstraints()
        activateImageViewConstraints()
        activateVStackConstraints()
        activateGradientViewConstraints()
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
            articleImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private func activateVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: const.hPadding),
            vStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -const.hPadding),
            vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -const.vPadding),
        ])
    }
    
    private func activateGradientViewConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: vStack.topAnchor, constant: -const.vPadding),
            gradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
