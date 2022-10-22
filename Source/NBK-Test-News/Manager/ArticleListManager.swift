//
//  ArticleListManager.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import NewsNetwork

public class ArticleListManager: ObservableObject {
    @Published public var list: [Article] = []
    @Published public var country: Country = .allCountry
    @Published public var category: NewsCategory = .general
    @Published public var isLoading: Bool = false
    @Published public var error: NError?
    private let service: NewsService
    private var currentPage: Int = 0
    private var totalPages: Int = 1
    
    public init(service: NewsService = NewsService()) {
        self.service = service
    }
    
    public var hasNextPage: Bool {
        currentPage < totalPages
    }
    
    public func reset() {
        list = []
        currentPage = 0
        totalPages = 1
    }
    
    public func load(completion: ((_ error: NError?) -> Void)? = nil) {
        guard hasNextPage else { return }
        
        currentPage += 1
        isLoading = true
        
        service.fetchTopArticles(model: makeRMTopArticle(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let content):
                self.totalPages = content.totalResults / 20
                
                if self.currentPage == 1 {
                    self.list = content.articles
                } else {
                    self.list.append(contentsOf: content.articles)
                }
                completion?(nil)
                
            case .failure(let error):
                self.error = error
                completion?(error)
            }
        }
    }
    
    private func makeRMTopArticle(page: Int) -> RMTopArticle {
        RMTopArticle(
            country: country == .allCountry ? nil : country.code,
            category: category.rawValue.lowercased(),
            page: page
        )
    }
}
