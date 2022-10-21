//
//  NewsSource.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct NewsSource: Codable {
    public var id: String?
    public var name: String?
    public var description: String?
    public var url: String?
    public var category: String?
    public var language: String?
    public var country: String?
    
    public init(id: String? = nil, name: String? = nil, description: String? = nil, url: String? = nil, category: String? = nil, language: String? = nil, country: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.url = url
        self.category = category
        self.language = language
        self.country = country
    }
}
