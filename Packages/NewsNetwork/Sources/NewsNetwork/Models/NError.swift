//
//  NError.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public enum NError: Error {
    case createURLFailed(reason: String)
    case responseFailed(reason: URLResponse)
    case unexpectedStatusCode(code: Int)
}
