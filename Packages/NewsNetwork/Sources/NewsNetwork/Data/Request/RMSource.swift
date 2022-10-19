//
//  RMSource.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct RMSource: Encodable {
    internal let apiKey = Shared.apiKey
    public var country: String?
    public var category: String?
    public var language: String?
    
    public init(country: String? = nil, category: String? = nil, language: String? = nil) {
        self.country = country
        self.category = category
        self.language = language
    }
}
