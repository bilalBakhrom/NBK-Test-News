//
//  NResource.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import SwiftUI

public enum NResource<T> {
    case loading
    case success(T)
    case failure(NError)
}

extension NResource {
    public var loading: Bool {
        if case .loading = self {
            return true
        }
        
        return false
    }
    
    public var error: NError? {
        switch self {
        case .failure(let error):
            return error
            
        default:
            return nil
        }
    }
    
    public var value: T? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
}

extension NResource {
    public func isLoading<Content: View>(@ViewBuilder content: @escaping () -> Content) -> Content? {
        if loading {
            return content()
        }
        
        return nil
    }
    
    public func hasResource<Content: View>(@ViewBuilder content: @escaping (T) -> Content) -> Content? {
        if let value = value {
            return content(value)
        }
        
        return nil
    }
    
    public func hasError<Content: View>(@ViewBuilder content: @escaping (NError) -> Content) -> Content? {
        if let error = error {
            return content(error)
        }
        
        return nil
    }
}
