//
//  Codable+Addition.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

extension Encodable {
    public var toAnyValueDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        return jsonObject.flatMap { $0 as? [String: Any] }
    }
    
    public var toStringValueDictionary: [String: String]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        return jsonObject.flatMap { $0 as? [String: String] }
    }
}
