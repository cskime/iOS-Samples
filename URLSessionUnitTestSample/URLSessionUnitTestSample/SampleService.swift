//
//  SampleService.swift
//  URLSessionUnitTestSample
//
//  Created by chamsol kim on 2023/02/16.
//

import Foundation

class SampleService {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request(completion: @escaping (Bool) -> Void) {
        let request = URLRequest(url: URL(string: "https://www.google.com")!)
        session.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  data != nil
            else {
                return completion(false)
            }
            
            return completion(true)
        }.resume()
    }
}

