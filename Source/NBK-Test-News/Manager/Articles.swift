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
    private var currentPage: Int = 0
    private var totalPages: Int = 1
    
    public var hasNextPage: Bool {
        currentPage < totalPages
    }
    
    public func fetchFirstPage() {
        isLoading = true
        
        service.fetchTopArticles(model: makeRMTopArticle(page: 1)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let content):
                self.totalPages = content.totalResults / 20
                self.currentPage += 1
                self.list = content.articles
                
            case .failure(let error):
                self.error = error
            }
            
            self.isLoading = false
        }
    }
    
    public func loadMore() {
        guard hasNextPage else { return }        
        currentPage += 1
        isLoading = true
        
        service.fetchTopArticles(model: makeRMTopArticle(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let content):
                self.totalPages = content.totalResults / 20
                self.currentPage += 1
                self.list.append(contentsOf: content.articles) 
                
            case .failure(let error):
                self.error = error
            }
            
            self.isLoading = false
        }
    }
    
    private func makeRMTopArticle(page: Int) -> RMTopArticle {
        RMTopArticle(page: page)
    }
}
