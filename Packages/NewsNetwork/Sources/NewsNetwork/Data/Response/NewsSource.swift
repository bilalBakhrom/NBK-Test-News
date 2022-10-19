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
}
