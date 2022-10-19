//
//  RMTopArticle.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct RMTopArticle: Encodable {
    private let apiKey = Shared.apiKey
    public var country: String?
    public var category: String?
    public var sources: String?
    public var q: String?
    public var pageSize: Int = 20
    public var page: Int?
}
