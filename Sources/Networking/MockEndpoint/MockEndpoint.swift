//
//  MockEndpoint.swift
//  
//
//  Created by johann casique on 27/4/21.
//

import Foundation

public protocol MockEndpoint: Endpoint {
    var mockFilename: String? { get }
    var mockExtension: String? { get }
}

extension MockEndpoint {
    public func mockData() -> Data? {
        guard let mockFileUrl = Bundle.main.url(forResource: mockFilename, withExtension: mockExtension),
              let mockData = try? Data(contentsOf: mockFileUrl) else {
            return nil
        }
        return mockData
    }
}
