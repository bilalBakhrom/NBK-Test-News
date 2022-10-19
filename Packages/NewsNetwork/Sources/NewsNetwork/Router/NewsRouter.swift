//
//  NewsRouter.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public enum NewsRouter: RequestConvertible {
    case topArticles(model: RMTopArticle)
    case sources(model: RMSource)
    
    public var path: String {
        switch self {
        case .topArticles: return "/top-headlines"
        case .sources: return "/top-headlines/sources"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .topArticles(let model):
            return model.toAnyValueDictionary
            
        case .sources(let model):
            return model.toAnyValueDictionary
        }
    }
    
    public func asURLRequest() throws -> URLRequest? {
        let url = try asQueryURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers
        
        return urlRequest
    }
}
