//
//  HomeViewModel.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import Foundation
import Combine
import NewsNetwork

public final class HomeViewModel {
    public let articles = Articles()
    public var list: [Article] = []
    private var subscriptions: Set<AnyCancellable> = []
            
    public func fetch() {
        articles.fetchFirstPage()
    }
    
    public func observeData(using block: @escaping (_ didFail: Bool) -> Void) {
        articles
            .$list
            .sink { [weak self] list in
                self?.list = list
                block(false)
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
