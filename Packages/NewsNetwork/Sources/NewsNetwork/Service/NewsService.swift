//
//  NewsService.swift
//  
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine

public final class NewsService: AdaptableNetwork<NewsRouter> {
    public func fetchTopArticles(model: RMTopArticle, completion: @escaping ServiceCompletion<ArticleListHolder>) {
        bind(ArticleListHolder.self, from: .topArticles(model: model), completion: completion)
    }
    
    public func fetchSources(model: RMSource, completion: @escaping ServiceCompletion<SourceListHolder>) {
        bind(SourceListHolder.self, from: .sources(model: model), completion: completion)
    }
}
