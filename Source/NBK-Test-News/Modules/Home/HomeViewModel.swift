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
    @ObservedObject public var listManager: ArticleListManager
    public var list: [Article] = []
    private var subscriptions: Set<AnyCancellable> = []
    
    public init(listManager: ArticleListManager = ArticleListManager()) {
        self.listManager = listManager
    }
            
    public func fetch() {
        listManager.load()
    }
    
    public func observeList(using block: @escaping (_ items: [Article], _ start: Int, _ end: Int) -> Void) {
        listManager
            .$list
            .sink { [weak self] newList in
                guard let self, !newList.isEmpty else { return }
                
                let start = self.list.count
                let end = newList.count - 1
                self.list = newList
                block(newList, start, end)
            }
            .store(in: &subscriptions)
    }
    
    public func observeError(using block: @escaping (_ error: NError) -> Void) {
        listManager
            .$error
            .sink { error in
                guard let error else { return }
                block(error)
            }
            .store(in: &subscriptions)
    }
    
    public func observeLoaderState(using block: @escaping (_ isLoading: Bool) -> Void) {
        listManager
            .$isLoading
            .sink { isLoading in
                block(isLoading)
            }
            .store(in: &subscriptions)
    }
}
