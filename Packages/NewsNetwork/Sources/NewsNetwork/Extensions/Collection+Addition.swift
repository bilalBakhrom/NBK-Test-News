//
//  Collection+Addition.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    public var queryItems: [URLQueryItem] {
        self.map { URLQueryItem(name: $0.key, value: $0.value)}
    }
}
