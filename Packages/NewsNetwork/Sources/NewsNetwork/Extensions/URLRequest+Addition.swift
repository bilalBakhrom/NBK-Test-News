//
//  URLRequest+Addition.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

extension URLRequest {
    public var method: HTTPMethod? {
        get {
            if let httpMethod = httpMethod {
                return HTTPMethod(rawValue: httpMethod)
            } else {
                return nil
            }
        } set(newMethod) {
            httpMethod = newMethod?.rawValue
        }
    }
    
    public var headers: Headers? {
        get { allHTTPHeaderFields }
        set { allHTTPHeaderFields = newValue }
    }
}
