//
//  Article.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct Article: Codable {
    public var source: NewsSource
    public var author: String?
    public var title: String?
    public var description: String?
    public var urlToPost: String?
    public var pathToImage: String?
    public var publishedAt: String?
    public var content: String?
    
    public var urlToImage: URL? {
        URL(string: pathToImage ?? "")
    }
    
    public init(
        source: NewsSource,
        author: String? = nil,
        title: String? = nil,
        description: String? = nil,
        urlToPost: String? = nil,
        pathToImage: String? = nil,
        publishedAt: String? = nil,
        content: String? = nil
    ) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.urlToPost = urlToPost
        self.pathToImage = pathToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    internal enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case urlToPost = "url"
        case pathToImage = "urlToImage"
        case publishedAt
        case content
    }
}
