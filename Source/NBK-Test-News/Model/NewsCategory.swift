//
//  NewsCategory.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import Foundation

public enum NewsCategory: String, Identifiable, Hashable, CaseIterable {
    case general = "General"
    case business = "Business"
    case entertainment = "Entertainment"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    public var id: String { rawValue }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
