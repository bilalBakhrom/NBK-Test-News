//
//  HomeViewModel.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine
import NewsNetwork
import SwiftUI

public typealias AddUp = (start: Int, end: Int)

public final class HomeViewModel {
    @ObservedObject public var listManager: ArticleListManager
    public var articles: [Article] = []    
    private var subscriptions: Set<AnyCancellable> = []
    
    public init(listManager: ArticleListManager = ArticleListManager()) {
        self.listManager = listManager
    }
    
    public func reset() {
        articles = []
        listManager.reset()
    }
            
    public func fetch() {
        listManager.load()
    }
    
    public func addArticlesObserver(using block: @escaping (_ items: [Article], _ meta: AddUp) -> Void) {
        listManager
            .$list
            .sink { [weak self] list in
                guard let self, list.hasElements else { return }
                
                let meta: AddUp = (self.articles.count, list.count - 1)
                self.articles = list
                block(list, meta)
            }
            .store(in: &subscriptions)
    }
    
    public func addErrorObserver(using block: @escaping (_ error: NError) -> Void) {
        listManager
            .$error
            .sink { error in
                guard let error else { return }
                block(error)
            }
            .store(in: &subscriptions)
    }
    
    public func addLoaderObserver(using block: @escaping (_ isLoading: Bool) -> Void) {
        listManager
            .$isLoading
            .sink { isLoading in
                block(isLoading)
            }
            .store(in: &subscriptions)
    }
}
