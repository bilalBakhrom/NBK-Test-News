//
//  ArticleListHolder.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct ArticleListHolder: Codable {
    public var status: String
    public var totalResults: Int
    public var articles: [Article]
    
    public init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}
