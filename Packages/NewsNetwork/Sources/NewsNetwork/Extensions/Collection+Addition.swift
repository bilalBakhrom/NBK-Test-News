//
//  Collection+Addition.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    public var queryItems: [URLQueryItem] {
        self.map {
            if let string = $0.value as? String {
                return URLQueryItem(name: $0.key, value: string)
            } else if let integer = $0.value as? Int {
                return URLQueryItem(name: $0.key, value: String(integer))
            } else {
                return URLQueryItem(name: $0.key, value: $0.value as? String)
            }
        }
    }
}
