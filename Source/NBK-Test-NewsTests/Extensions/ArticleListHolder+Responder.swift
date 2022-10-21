//
//  ArticleListHolder+Responder.swift
//  NBK-Test-NewsTests
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import Foundation
@testable import NewsNetwork

extension ArticleListHolder {
    enum MockDataURLResponder: MockURLResponder {
        static let item: ArticleListHolder = {
            let articles = [Article(source: NewsSource()), Article(source: NewsSource())]
            let content = ArticleListHolder(status: "200", totalResults: 100, articles: articles)
            return content
        }()

        static func respond(to request: URLRequest) throws -> Data {
            return try JSONEncoder().encode(item)
        }
    }
}
