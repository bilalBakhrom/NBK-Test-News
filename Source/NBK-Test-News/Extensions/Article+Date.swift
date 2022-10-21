//
//  Article+Date.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 20/10/2022.
//

import Foundation
import NewsNetwork

private let inDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    return dateFormatter
}()

private let outDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    
    return dateFormatter
}()

extension Article {
    public var readableDate: String {
        let date = inDateFormatter.date(from: publishedAt ?? "")
        
        if let date {
            return outDateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
