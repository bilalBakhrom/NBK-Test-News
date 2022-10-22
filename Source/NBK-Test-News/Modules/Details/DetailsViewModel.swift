//
//  DetailsViewModel.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 22/10/2022.
//

import Foundation
import SwiftUI
import NewsNetwork

public class DetailsViewModel: ObservableObject {
    @Published public var article: Article
    @Published public var resource: NResource<UIImage> = .loading
    @Published public var isBottomSheetOpen: Bool = false
    
    public init(article: Article) {
        self.article = article
    }
    
    @MainActor
    public func loadImage() async {
        guard let urlString = article.pathToImage else {
            return
        }
        
        let manager = ImageTaskManager(urlString: urlString)
        resource = await manager.resource()
    }
}
