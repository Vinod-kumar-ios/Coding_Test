//
//  NewsViewControllerTestCase.swift
//  Coding_TestTests
//
//  Created by Vinod Kumar  on 21/03/22.
//

import XCTest
@testable import Coding_Test

class NewsViewControllerTestCase: XCTestCase {

    let sut = NewsViewController.init(apiClient: Webservice())
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_News_API_Calling_with_ApiClient() {
        let expectation = self.expectation(description: "test_Get_Article_API_Positive_Response_In_Controller_APIClient")
        sut.apiClient.execute(from: APIConfig.shared.baseURL) { result in
            expectation.fulfill()
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertTrue(true)
            case .failure(_):
                XCTFail("API calling failed")
            }
            
        }
        self.waitForExpectations(timeout: 2.0)
    }
    
    func test_NewsController_API_Calling() {
        let expectation = self.expectation(description: "test_Get_Article_API_Positive_Response")
        sut.getNews()
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {[weak self] in
            expectation.fulfill()
            XCTAssertNotNil(self?.sut.viewModel)
            XCTAssertNotEqual(self?.sut.viewModel?.numberOfRowsInSection(0), 0)
            
        }
        self.waitForExpectations(timeout: 2.0)
    }
    
    func test_UI_Components() {
        XCTAssertNotNil(sut.newsTableView)
        XCTAssertNotNil(sut.refreshControl)
    }
    
}
