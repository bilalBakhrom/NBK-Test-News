//
//  SourceListHolder.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation

public struct SourceListHolder: Codable {
    public var status: String
    public var sources: [NewsSource]
}
