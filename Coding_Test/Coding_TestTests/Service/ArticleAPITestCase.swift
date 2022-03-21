//
//  ArticleAPITestCase.swift
//  Coding_TestTests
//
//  Created by Vinod Kumar  on 21/03/22.
//

import XCTest
@testable import Coding_Test

class ArticleAPITestCase: XCTestCase {
    
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
    func test_Correct_API_Params() {
        XCTAssertEqual("https", APIConfig.shared.scheme, "please use correct url scheme")
        XCTAssertEqual("newsapi.org/v2/top-headlines", APIConfig.shared.host, "please use correct host")
        XCTAssertEqual("in", APIConfig.shared.country, "please use correct country code")
        XCTAssertEqual("2051c84de7de4eb481a8babdaa145712", APIConfig.shared.key, "please use correct API Key")
        XCTAssertEqual("https://newsapi.org/v2/top-headlines?country=in&apiKey=2051c84de7de4eb481a8babdaa145712", APIConfig.shared.baseURL, "please use correct url")
    }
    
    func test_Wrong_API_Params() {
        XCTAssertNotEqual("http", APIConfig.shared.scheme)
        XCTAssertNotEqual("newsapi.org/v2/", APIConfig.shared.host)
        XCTAssertNotEqual("au", APIConfig.shared.country)
        XCTAssertNotEqual("2051c84", APIConfig.shared.key)
        XCTAssertNotEqual("https://newsapi.org/v2/top-headlines?country=in&apiKey=2051c84de7de4eb481a8babdaa1457121", APIConfig.shared.baseURL)
    }
    
    
    func test__Get_Article_API_Positive_Response(){
        let expectation = self.expectation(description: "test_Get_Article_API_Positive_Response")
        let apiClient = Webservice()
        apiClient.execute(from: APIConfig.shared.baseURL) { result in
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
    
}
