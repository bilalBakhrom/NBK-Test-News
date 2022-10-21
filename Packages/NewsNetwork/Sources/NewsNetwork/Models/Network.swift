//
//  Network.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine

public protocol Network {
    associatedtype Router: RequestConvertible
    var session: URLSession { get set }
}

extension Network {
    internal func request<T: Decodable>(_ type: T.Type, from router: Router) -> AnyPublisher<T, NError> {
        guard let request = router.urlRequest() else {
            fatalError()
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap  { (data: Data, response: URLResponse) in
                #if DEBUG
                NLog.log(request: request, response: response, data: data)
                #endif
                
                return try monitor(data: data, response: response)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? NError {
                    return error
                } else {
                    return NError.internalError(error: error)
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func monitor(data: Data, response: URLResponse) throws -> Data {
        guard let response = response as? HTTPURLResponse else {
            throw NError.responseFailed(reason: response)
        }
        
        if response.statusCode >= 200 && response.statusCode <= 300 {
            return data
        } else {
            throw NError.unexpectedStatusCode(code: response.statusCode)
        }
    }
}
