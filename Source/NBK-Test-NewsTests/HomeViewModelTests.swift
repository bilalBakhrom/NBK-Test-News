//
//  HomeViewModelTests.swift
//  NBK-Test-NewsTests
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import XCTest
@testable import NBK_Test_News
@testable import NewsNetwork

final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        
        let manager = makeArticleListManager()
        sut = HomeViewModel(listManager: manager)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testObserveListAfterSuccessfullyFetching() {
        let testExpectation = expectation(description: "Should receive data")
                
        sut.observeList { items, _, _ in
            XCTAssertEqual(2, items.count)
            testExpectation.fulfill()
        }
        
        sut.fetch()
        waitForExpectations(timeout: 3.0)
    }
    
    func testObserveError() {
        let errorMockSession = URLSession(mockResponder: MockErrorURLResponder.self)
        let manager = ArticleListManager(service: NewsService(session: errorMockSession))
        let viewModel = HomeViewModel(listManager: manager)
        let testExpectation = expectation(description: "Should recieve an error")
                
        viewModel.observeError { error in
            XCTAssertNotNil(error)
            testExpectation.fulfill()
        }
        
        viewModel.fetch()
        waitForExpectations(timeout: 3.0)
    }
    
    // MARK: - Support
    private func makeArticleListManager() -> ArticleListManager {
        let mockSession = URLSession(mockResponder: ArticleListHolder.MockDataURLResponder.self)
        let service = NewsService(session: mockSession)
        return ArticleListManager(service: service)
    }
}
