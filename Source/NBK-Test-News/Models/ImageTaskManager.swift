//
//  ImageTaskManager.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 20/10/2022.
//

import SwiftUI
import NewsNetwork
import Nuke

public class ImageTaskManager {
    public let urlString: String
    
    public init(urlString: String) {
        self.urlString = urlString
    }
    
    public func resource() async -> NResource<UIImage> {
        do {
            let data = try await loadData()
            return .success(data)
        } catch  {
            return .failure(.technicIssue)
        }
    }
    
    public func loadData() async throws -> UIImage {
        guard let url = URL(string: urlString) else { throw ImageFetchError.badURL }
        let response = try await ImagePipeline.shared.image(for: url)
        return response.image
    }
    
    public enum ImageFetchError: Error {
        case badURL
    }
}
