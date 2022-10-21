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
    private var mockSession: URLSession!
    private var sut: ArticleListManager!
    
    override func setUp() {
        super.setUp()
        
        mockSession = URLSession(mockResponder: ArticleListHolder.MockDataURLResponder.self)
        sut = ArticleListManager(service: NewsService(session: mockSession))
    }
    
    override func tearDown() {
        super.tearDown()
        mockSession = nil
        sut = nil
    }
    
    func testSuccessfullyFetchingArticles() throws {
        let testExpectation = expectation(description: "Received response")
        
        sut.load { error in
            XCTAssertNil(error)
            XCTAssertEqual(2, self.sut.list.count)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testFetchingMoreArticlesWhileScrolling() throws {
        let textExpectation = expectation(description: "Received response")
        
        sut.load { error in
            XCTAssertNil(error)
            XCTAssertEqual(2, self.sut.list.count)
            
            self.sut.load { error in
                XCTAssertNil(error)
                XCTAssertEqual(4, self.sut.list.count)
                textExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3.0)
    }
    
    func testFailingWhenEncounterError() throws {
        let errorMockSession = URLSession(mockResponder: MockErrorURLResponder.self)
        let manager = ArticleListManager(service: NewsService(session: errorMockSession))
        let testExpectation = expectation(description: "Received response")
        
        manager.load { error in
            XCTAssertNotNil(error)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
    }
}
