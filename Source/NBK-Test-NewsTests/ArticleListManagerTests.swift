//
//  ArticleListManagerTests.swift
//  NBK-Test-NewsTests
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import XCTest
@testable import NBK_Test_News
@testable import NewsNetwork

final class ArticleListManagerTests: XCTestCase {
    func testSuccessfullyFetchingArticles() throws {
        let mockSession = URLSession(mockResponder: ArticleListHolder.MockDataURLResponder.self)
        let articles = ArticleListManager(service: NewsService(session: mockSession))
        let articleLoadExpectation = expectation(description: "Received response")
        
        articles.load { error in
            XCTAssertNil(error)
            XCTAssertEqual(2, articles.list.count)
            articleLoadExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testFetchingMoreArticlesWhileScrolling() throws {
        let mockSession = URLSession(mockResponder: ArticleListHolder.MockDataURLResponder.self)
        let articles = ArticleListManager(service: NewsService(session: mockSession))
        let articleLoadExpectation = expectation(description: "Received response")
        
        articles.load { error in
            XCTAssertNil(error)
            XCTAssertEqual(2, articles.list.count)
            
            articles.load { error in
                XCTAssertNil(error)
                XCTAssertEqual(4, articles.list.count)
                articleLoadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testFailingWhenEncounterError() throws {
        let mockSession = URLSession(mockResponder: MockErrorURLResponder.self)
        let articles = ArticleListManager(service: NewsService(session: mockSession))
        let articleLoadExpectation = expectation(description: "Received response")
        
        articles.load { error in
            XCTAssertNotNil(error)
            articleLoadExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
}
