//
//  RequestConvertible.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine

public typealias Parameters = [String: Any]
public typealias Headers = [String: String]

public protocol RequestConvertible {
    var environment: Environment { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: Headers? { get }
    var parameters: Parameters? { get }
    
    func asURLRequest() throws -> URLRequest?
}

extension RequestConvertible {
    public var environment: Environment {
        return .newsBase
    }
    
    public var headers: Headers? {
        return .defaultHeaders
    }
    
    public var parameters: Parameters? {
        return nil
    }
    
    public func asURL() throws -> URL {
        let endPointString = environment.rawValue + path
        
        if let url = URL(string: endPointString) {
            return url
        } else  {
            throw NError.createURLFailed(reason: "Couldn't create URL from \(endPointString)")
        }
    }
    
    public func asQueryURL() throws -> URL {
        let endPointString = environment.rawValue + path
        var component = URLComponents(string: endPointString)
        component?.queryItems = parameters?.queryItems
        
        if let url = component?.url {
            return url
        } else  {
            throw NError.createURLFailed(reason: "Couldn't create URL from \(endPointString)")
        }
    }
    
    public func urlRequest() -> URLRequest? {
        return try? asURLRequest()
    }
}

extension Headers {
    public static var defaultHeaders: Headers {
        return [
            "Content-Type" : "application/json",
            "Connection" : "keep-alive",
            "x-api-key" : Shared.apiKey
        ]
    }
}
