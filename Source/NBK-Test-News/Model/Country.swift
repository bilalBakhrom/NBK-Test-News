//
//  Country.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import Foundation

public struct Country: Identifiable, Hashable {
    public var id: String
    public var name: String
    public var code: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Country {
    public static var allCountry: Country {
        Country(id: "21j3blra", name: "All Country", code: "none")
    }
}
