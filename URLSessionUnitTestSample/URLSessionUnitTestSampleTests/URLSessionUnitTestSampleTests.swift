//
//  URLSessionUnitTestSampleTests.swift
//  URLSessionUnitTestSampleTests
//
//  Created by chamsol kim on 2023/02/16.
//

import XCTest
@testable import URLSessionUnitTestSample

final class URLSessionTestSampleTests: XCTestCase {
    
    var session: URLSession!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        session = URLSession(configuration: configuration)
        URLProtocolMock.requestHandler = nil
    }

    func testSuccess() {
        let dummyData = "data".data(using: .utf8)!
        URLProtocolMock.requestHandler = { request in
            return (HTTPURLResponse(), dummyData)
        }
        
        let expectation = XCTestExpectation(description: "Response")
        let service = SampleService(session: session)
        service.request { isSucceed in
            XCTAssertTrue(isSucceed)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testFailureWhenDataIsNil() {
        URLProtocolMock.requestHandler = { request in
            return (HTTPURLResponse(), nil)
        }
        
        let expectation = XCTestExpectation(description: "Response")
        let service = SampleService(session: session)
        service.request { isSucceed in
            XCTAssertFalse(isSucceed)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testFailureWhenThrowError() {
        URLProtocolMock.requestHandler = { request in
            throw NSError(domain: "error", code: 0)
        }
        
        let expectation = XCTestExpectation(description: "Response")
        let service = SampleService(session: session)
        service.request { isSucceed in
            XCTAssertFalse(isSucceed)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
