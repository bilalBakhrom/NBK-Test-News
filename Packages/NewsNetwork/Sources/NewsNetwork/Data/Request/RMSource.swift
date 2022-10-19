//
//  RMSource.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct RMSource: Encodable {
    private let apiKey = Shared.apiKey
    public var country: String?
    public var category: String?
    public var language: String?
}
