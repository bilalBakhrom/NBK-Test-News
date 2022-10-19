//
//  RMTopArticle.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct RMTopArticle: Encodable {
    internal let apiKey = Shared.apiKey
    public var country: String?
    public var category: String?
    public var sources: String?
    public var q: String?
    public var language: String
    public var pageSize: Int
    public var page: Int?
    
    public init(
        country: String? = nil,
        category: String? = nil,
        sources: String? = nil,
        q: String? = nil,
        language: String = "en",
        pageSize: Int = 20,
        page: Int? = nil
    ) {
        self.country = country
        self.category = category
        self.sources = sources
        self.q = q
        self.language = language
        self.pageSize = pageSize
        self.page = page
    }
}
