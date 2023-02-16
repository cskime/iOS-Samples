//
//  URLProtocolMock.swift
//  URLSessionUnitTestSampleTests
//
//  Created by chamsol kim on 2023/02/16.
//

import Foundation

class URLProtocolMock: URLProtocol {
    
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse?, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = Self.requestHandler else {
            client?.urlProtocolDidFinishLoading(self)
            return
        }
        
        do {
            let (response, data) = try handler(request)
            
            guard let response = response, let data = data else {
                client?.urlProtocol(self, didFailWithError: NSError(domain: "", code: 0, userInfo: nil))
                return
            }
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
        // Not interested
    }
}

