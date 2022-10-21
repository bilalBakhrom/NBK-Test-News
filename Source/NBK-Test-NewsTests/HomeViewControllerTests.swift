//
//  HomeViewControllerTests.swift
//  NBK-Test-NewsTests
//
//  Created by Bilal Bakhrom on 21/10/2022.
//

import XCTest
@testable import NBK_Test_News
@testable import NewsNetwork

final class HomeViewControllerTests: XCTestCase {
    private var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        sut.set(viewModel: makeHomeViewModelWithMockData())
        sut.loadView()
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testHasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewConformsToTableViewDelegateProtocols() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
//    func testBind() {
//        let exp = expectation(description: "Should load articles")
//        
//        sut.viewModel.obser
//    }
    
    // MARK: - Support
    private func makeHomeViewModelWithMockData() -> HomeViewModel {
        let mockSession = URLSession(mockResponder: ArticleListHolder.MockDataURLResponder.self)
        let service = NewsService(session: mockSession)
        let listManager = ArticleListManager(service: service)
        
        return HomeViewModel(listManager: listManager)
    }
}
