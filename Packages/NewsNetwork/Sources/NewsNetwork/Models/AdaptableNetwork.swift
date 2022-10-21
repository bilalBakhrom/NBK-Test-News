//
//  AdaptableNetwork.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine

public class AdaptableNetwork<SomeRouter: RequestConvertible>: Network {
    public typealias Router = SomeRouter
    public typealias ServiceCompletion<C: Codable> = (Result<C, NError>) -> Void
    public var session: URLSession
    private var subscriptions: Set<AnyCancellable> = []
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    internal func bind<T: Codable>(_ type: T.Type, from router: Router, completion: @escaping ServiceCompletion<T>) {
        request(T.self, from: router)
            .receive(on: DispatchQueue.main)
            .sink { receivedCompletion in
                switch receivedCompletion {
                case .failure(let error):
                    completion(.failure(error))
                    
                default:
                    break
                }
            } receiveValue: { model in
                completion(.success(model))
            }
            .store(in: &subscriptions)
    }
}
