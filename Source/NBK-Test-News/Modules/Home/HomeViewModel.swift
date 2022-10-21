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

public final class HomeViewModel {
    @ObservedObject public var articles = Articles()
    public var list: [Article] = []
    private var subscriptions: Set<AnyCancellable> = []
            
    public func fetch() {
        articles.fetchFirstPage()
    }
    
    public func loadMore() {
        articles.loadMore()
    }
    
    public func observeData(using block: @escaping (_ didFail: Bool) -> Void, didUpdateItemsBlock: ((_ start: Int, _ end: Int) -> Void)? = nil) {
        articles
            .$list
            .sink { [weak self] list in
                guard let self else { return }
                
                let start = self.list.count
                let end = list.count - 1
                self.list = list
                
                if self.list.isEmpty {
                    block(false)
                } else {
                    didUpdateItemsBlock?(start, end)
                }
            }
            .store(in: &subscriptions)
        
        articles
            .$error
            .sink { error in
                guard let _ = error else { return }
                block(true)
            }
            .store(in: &subscriptions)
    }
    
    public func observeLoader(using block: @escaping (_ isLoading: Bool) -> Void) {
        articles
            .$isLoading
            .sink { isLoading in
                block(isLoading)
            }
            .store(in: &subscriptions)
    }
}
