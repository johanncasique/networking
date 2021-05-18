//
//  File.swift
//  
//
//  Created by johann casique on 18/5/21.
//

import Foundation

extension MockEndpoint {
    func mockData() -> Data? {
        guard let mockFileUrl = Bundle.main.url(forResource: mockFilename, withExtension: mockExtension),
            let mockData = try? Data(contentsOf: mockFileUrl) else {
                return nil
        }
        return mockData
    }
}

extension MockEndpoint {
    var mockExtension: String? {
        return "json"
    }
}

