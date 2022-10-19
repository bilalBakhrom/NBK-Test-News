//
//  Articles.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import NewsNetwork

public class Articles: ObservableObject {
    @Published public var list: [Article] = []
    @Published public var isLoading: Bool = false
    @Published public var error: NError?
    private let service = NewsService()
    
    func fetchFirstPage() {
        isLoading = true
        
        service.fetchTopArticles(model: makeRMTopArticle()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let content):
                self.list = content.articles
                
            case .failure(let error):
                self.error = error
            }
            
            self.isLoading = false
        }
    }
    
    private func makeRMTopArticle() -> RMTopArticle {
        RMTopArticle()
    }
}
